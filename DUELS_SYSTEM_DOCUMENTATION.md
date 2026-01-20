# DUELS System Mechanics Documentation

This document provides a detailed explanation of how the DUELS system functions in the game, based on analysis of the decompiled codebase.

## Table of Contents
1. [System Overview](#system-overview)
2. [Full Duel Lifecycle](#full-duel-lifecycle)
3. [Disconnection and Reconnection Handling](#disconnection-and-reconnection-handling)
4. [Brainrot/Pet Tracking and Synchronization](#brainrotpet-tracking-and-synchronization)

---

## System Overview

The DUELS system is a PvP (Player vs Player) feature that allows players to wager their brainrots/pets against each other in combat. The system operates across multiple game servers with a dedicated duels place (`DuelsPlaceId`), separate from the main game servers.

### Key Components

| Component | File | Purpose |
|-----------|------|---------|
| `DuelsMachineController` | `DuelsMachineController194.luau` | Client-side invite system and matchmaking UI |
| `DuelsMachineMatchController` | `DuelsMachineMatchController705.luau` | In-duel session management, brainrot selection, voting, and round tracking |
| `DuelsModes` | `DuelsModes91.luau` | Game mode definitions (Bat Only, Bat + Medusa, All Gears) |
| `ServerData` | `ServerData978.luau` | Server type detection and place ID configuration |
| `Synchronizer` | `Synchronizer215.luau` | Real-time data synchronization between server and clients |
| `ReplicatorClient` | `ReplicatorClient953.luau` | Replication system for duel state across servers |

### Server Architecture

```
Main Game Servers (RootPlaceId) ──┐
                                  ├─── DuelsMachineService (Invite/Matchmaking)
New Player Servers ───────────────┤
                                  └─── Teleports to ──→ Duels Servers (DuelsPlaceId)
                                                              │
                                                              ├── DuelsMachineMatchService
                                                              ├── SelectBrainrots Replicator
                                                              └── DuelsRounds Replicator
```

---

## Full Duel Lifecycle

### Phase 1: Initialization (Invite System)

The duel process begins when a player invites another player through the `DuelsMachineController`.

#### 1.1 Sending an Invite

```lua
-- From DuelsMachineController194.luau
v35.SendInvite = function(_, v34)
    return v31:InvokeServer(v34);  -- DuelsMachineService/Invite
end
```

Players can invite others via:
- **Server Tab**: Players currently in the same server
- **Friends Tab**: Online friends (may be in different servers)
- **Global Tab**: Search for any user by username

#### 1.2 Invite Creation and Delivery

When an invite is sent:
1. Server validates the invite request
2. Creates an invite with an expiration time
3. Fires `DuelsMachineService/CreateInvite` remote event to the target player

```lua
-- Invite data structure
{
    id = inviteId,
    invite = {
        from = senderUserId,
        expires = expirationTimestamp
    }
}
```

#### 1.3 Accepting an Invite

When a player accepts:
```lua
v29:InvokeServer(v112);  -- DuelsMachineService/AcceptInvite
```

Both players are then teleported to a dedicated **Duels Server** (`DuelsPlaceId`).

---

### Phase 2: Matchmaking (Mode Selection & Voting)

Once on the Duels Server, players enter the mode voting phase.

#### 2.1 Vote Mode UI

The `DuelsModeVote` replicator manages voting state:

```lua
-- From DuelsMachineMatchController705.luau
local v39 = v3.get("DuelsModeVote");

v39:Observe({"timer"}, function(v105)
    -- Display countdown timer
    l_DuelsMachineVoteFrame_0.TimerLabel.Text = "Game starting in " .. (v105 // 1) .. " seconds"
end);

v39:Observe({"playerVotes"}, function(v109)
    -- Tally and display votes per mode
    for _, v112 in v109 do
        v110[v112] = (v110[v112] or 0) + 1;
    end
end);
```

#### 2.2 Available Game Modes

From `DuelsModes91.luau`:

| Mode | Color |
|------|-------|
| Bat Only | Red (209, 0, 3) |
| Bat + Medusa | Blue (0, 131, 225) |
| All Gears | Green (0, 163, 0) |

#### 2.3 Mode Selection Resolution

After voting ends:
- The mode with the most votes is selected
- `workspace:GetAttribute("DuelsSelectedMode")` is set
- UI updates to show the selected mode

---

### Phase 3: Active Duel State (Brainrot Selection)

#### 3.1 Brainrot Selection Phase

Players select which brainrot/pet to wager from their plot's `AnimalPodiums`.

```lua
-- SelectBrainrots Replicator structure
{
    lastChange = timestamp,
    players = {
        [userId] = {
            brainrot = {
                Index = "BrainrotName",
                UUID = "unique-identifier",
                Mutation = "MutationType",
                Traits = {"Trait1", "Trait2"}
            },
            indexOnPlot = podiumIndex,
            ready = boolean,
            accepted = boolean
        }
    }
}
```

#### 3.2 Selection Process

1. **Player opens selection UI**: `DuelsSelectBrainrotActive` workspace attribute is set
2. **Browse available brainrots**: Only brainrots not in machines/fusing can be selected
3. **Select brainrot**: `DuelsMachineMatchService/SelectBrainrot/Select` remote event
4. **Mark as ready**: `DuelsMachineMatchService/SelectBrainrot/Ready` remote event
5. **Accept match**: `DuelsMachineMatchService/SelectBrainrot/Accept` remote event (when both ready)

```lua
-- Brainrot marking as "In Duel"
-- From PlotClient670.luau line 265-267
elseif v98 and v90.Machine.Type == "Duel" then
    v97.Text = "IN DUEL";
    v97.TextColor3 = Color3.fromRGB(255, 94, 78);
```

#### 3.3 Countdown Animation

Once both players accept, a countdown animation plays:

```lua
-- From DuelsMachineMatchController705.luau
v116.OnClientEvent:Connect(function(v120)
    -- Countdown from v120 to 1
    for v121 = v120 // 1, 1, -1 do
        -- Display countdown number with animation
        v15:PlaySound("Sounds.Sfx.Duels.Countdown");
        task.wait(1);
    end
end);
```

---

### Phase 4: Resolution (Combat & Winner Determination)

#### 4.1 Round Tracking

The `DuelsRounds` replicator tracks match progress:

```lua
-- DuelsRounds structure
{
    roundTimer = secondsRemaining,
    expectedPlayers = {player1UserId, player2UserId},
    roundWins = {
        [userId] = winCount
    }
}
```

#### 4.2 Top Frame UI

Displays player info, round wins, and device icons:

```lua
-- Device icons per platform
v125 = {
    PC = "rbxassetid://87143261820372",
    Console = "rbxassetid://119798532223911",
    Mobile = "rbxassetid://72402748445638"
}
```

#### 4.3 Winner Screen

```lua
v11:RemoteEvent("DuelsMachineMatchService/SelectBrainrot/WinnerScreen").OnClientEvent:Connect(function(_)
    -- Display winner and transfer brainrot ownership
end);
```

---

## Disconnection and Reconnection Handling

The system has robust handling for players who disconnect during an active duel.

### Disconnection Detection

When a player disconnects from a duel server:
1. Server detects the disconnection
2. Stores reconnection data including:
   - Opponent's user ID
   - Duel state
   - Wagered brainrot info

### Reconnection Warning

When the player rejoins any server:

```lua
-- From DuelsMachineController194.luau line 457-485
v28.OnClientEvent:Connect(function(v129)  -- DuelsMachineService/Reconnect
    -- Get opponent's username
    local l_result_3 = v8:GetUser(v129);
    
    -- Check for player's synchronizer data
    local v132 = v5:Wait(l_LocalPlayer_0);
    
    -- Show reconnection prompt
    local v133 = v15:Show(
        "You disconnected an active duel with @" .. l_result_3.Username,
        600,  -- 10 minute timeout
        "ReconnectTemplate"
    );
    
    if not v133 then
        -- Player declined reconnection
        if not v132:Get("DuelsReconnectWarn") then
            -- Show forfeit warning
            if v15:Show(
                "Leaving the duel will count as a forfeit and you will lose your brainrot! Are you sure?",
                60,
                "WarningTemplate"
            ) then
                v26:FireServer();  -- DuelsMachineService/ReconnectWarn - Acknowledge forfeit
            end
        end
    end
    
    -- Attempt reconnection
    v28:FireServer(v133);  -- Send reconnection response to server
end);
```

### Reconnection Flow

```
Player Disconnects from Duel Server
            │
            ▼
    Server stores duel state
            │
            ▼
    Player Rejoins (any server)
            │
            ▼
    DuelsMachineService/Reconnect fires
            │
            ▼
┌───────────────────────────────────┐
│     Reconnection Prompt (600s)    │
├─────────────┬─────────────────────┤
│   Accept    │       Decline       │
│      │      │          │          │
│      ▼      │          ▼          │
│ Teleport to │   Forfeit Warning   │
│ Duel Server │          │          │
│             │    ┌─────┴─────┐    │
│             │ Confirm   Cancel    │
│             │    │         │      │
│             │    ▼         │      │
│             │ Lose Brainrot│      │
│             │ & Exit Duel  │      │
└─────────────┴──────────────┴──────┘
```

### Forfeit Consequences

If a player forfeits (by not reconnecting within the timeout or confirming forfeit):
- The disconnected player **loses their wagered brainrot**
- The opponent wins by default
- Brainrot ownership is transferred to the winner

---

## Brainrot/Pet Tracking and Synchronization

### Data Structure

Brainrots are stored in the player's `Synchronizer` channel under `AnimalPodiums`:

```lua
-- AnimalPodiums structure (per podium slot)
{
    Index = "Tralalero",           -- Brainrot type name
    UUID = "abc-123-def",          -- Unique identifier
    Mutation = "Rainbow",          -- Optional mutation
    Traits = {"10B", "Lightning"}, -- Array of traits
    Timer = 0,                     -- Hatch/cooldown timer
    LastCollect = timestamp,       -- Last coin collection time
    Machine = {                    -- If in a machine
        Type = "Duel",             -- Machine type: Duel, Fuse, Crafting, etc.
        Active = true              -- If currently processing
    },
    Steal = nil,                   -- UserId if stolen, nil otherwise
    OfflineGain = nil              -- Offline earnings multiplier
}
```

### Persistence Mechanism

#### Server-Side Synchronizer

The `Synchronizer` module creates **Channels** that sync data between server and clients:

```lua
-- From Synchronizer215.luau
v6.Create = function(v9, v10, v11)
    local v13 = v3.new(v10, v11, v9);  -- Create new Channel
    v5[v10] = v13;
    v6.OnChannelCreated:Fire(v13);
    return v12;
end
```

#### Client-Side Observation

Clients observe changes to brainrot data in real-time:

```lua
-- From PlotClient670.luau
v206.Channel:OnChanged("AnimalList", function(v100)
    -- Update visual display when brainrot data changes
    v206:UpdateAnimalPodiums();
end, true);
```

### Cross-Server Synchronization During Duels

#### Step 1: Brainrot Locking

When entering a duel:
```lua
-- Brainrot is marked as being in a Duel machine
brainrot.Machine = {
    Type = "Duel",
    Active = true  -- or false during selection
}
```

This prevents:
- Selling the brainrot
- Moving it to other machines
- Trading it

#### Step 2: Replicator-Based Sync

The `ReplicatorClient` system handles cross-server data:

```lua
-- From ReplicatorClient953.luau
-- Initialization packet structure
if v29 == v1 then  -- INIT_CMD
    v8[v30] = v31;  -- Map packet ID to replicator ID
    local v35 = v7.get(v31);
    v35.Data = v19(v32);  -- Deep copy initial data
    -- Fire all observers with new data
end

-- Update packet structure  
elseif v29 == v2 then  -- UPDATE_CMD
    -- Apply incremental updates to replicator data
    v47(v41.Data, v59, "\254");
    -- Notify all observers of changes
end
```

#### Step 3: SelectBrainrots Replicator

The `SelectBrainrots` replicator specifically tracks duel brainrot selection:

```lua
-- From DuelsMachineMatchController705.luau
local v43 = v3.get("SelectBrainrots");
v43:WaitForLoaded();

-- Observe player selections
v42:Add(v43:Observe({"players"}, function(v58)
    -- Update UI for each player's brainrot choice
    for v76, v77 in v58 do
        if v76 == tostring(l_LocalPlayer_0.UserId) then
            -- Update local player's display
        else
            -- Update opponent's display
        end
    end
end));
```

### Brainrot Display During Duels

The system displays brainrot information including:

```lua
-- Generation (income per second)
v83.Spacer.Cash.Text = "$" .. v21:ToString(
    v23:GetGeneration(v82.Index, v82.Mutation, v82.Traits)
) .. "/s"

-- Traits display
for _, v88 in v86 do
    local v89 = v20[v88];
    if v89 then
        local v90 = v79:Clone(v83.Spacer.Traits.Template);
        v90.Image = v89.Icon;
        v90.Parent = v83.Spacer.Traits;
    end
end

-- Mutation display via viewport model
local v85 = v23:AttachOnViewportWithOptimizations(
    v82.Index, 
    v83.Spacer.ViewportFrame, 
    nil, 
    v82.Mutation
);
```

### Transfer on Resolution

When the duel concludes:
1. Winner's brainrot is returned to their podium (Machine cleared)
2. Loser's brainrot is transferred to winner's inventory
3. Both players' `AnimalPodiums` synchronizers are updated
4. Winner screen is displayed

---

## Summary

The DUELS system is a sophisticated cross-server PvP feature with:

1. **Robust matchmaking** via invites across servers and friends lists
2. **Democratic mode selection** through a voting system
3. **Secure brainrot wagering** with machine-based locking
4. **Fault-tolerant reconnection** with forfeit warnings and timeouts
5. **Real-time synchronization** using the Replicator and Synchronizer systems
6. **Visual feedback** including countdown animations, device icons, and brainrot previews

The architecture ensures data consistency across servers and provides a fair, transparent dueling experience for players.

---

## Security & Exploit Analysis: Server Freeze Scenario

This section analyzes the potential for item duplication during server freezes and race conditions.

### Scenario Definition

```
Server S1 (Duels Server)
├── Account A (owns high-value brainrots)
├── Account B (owns low-value brainrots)
└── Active duel in progress

Timeline:
1. Exploiter causes Server S1 to freeze/timeout
2. Account A attempts to join Server S2 (main game)
3. Server S1 recovers, Account B wins by timeout
4. Account B receives brainrot rewards (potentially multiple times)
```

### Analysis Based on Codebase

#### 1. How Duel State and Item Ownership Are Tracked

Based on the codebase analysis, the system uses **multiple layers** of state tracking:

**Layer 1: Synchronizer Channels (Per-Server, In-Memory)**
```lua
-- From Synchronizer215.luau and Channel337.luau
-- Channels are created per-server and synced via RemoteEvents
v6.Create = function(v9, v10, v11)
    local v13 = v3.new(v10, v11, v9);  -- Creates in-memory channel
    v5[v10] = v13;  -- Stored in local table
    v6.OnChannelCreated:Fire(v13);
    return v12;
end
```

**Layer 2: Replion System (Per-Server Replication)**
```lua
-- From ServerReplion109.luau
-- Replion data is replicated to specific players/all players on THAT server only
v9.new = function(v10)
    -- Creates a new Replion with Data, Channel, Tags, ReplicateTo
    v1.sendTo(l_ReplicateTo_0, "Added", v13:_serialize());
    return v13;
end
```

**Layer 3: Player Data (DataStore/MemoryStore)**
```lua
-- From Store507.luau and Server65.luau
-- Uses DataStoreService and MemoryStoreService for persistence
v3.PlayerDS = l_RunService_0:IsStudio() and {} or l_DataStoreService_0:GetDataStore("GA_PlayerDS_1.0.0")
```

**Critical Finding: No Cross-Server Atomic Lock**

The codebase shows that:
- `Synchronizer` channels are **server-local** in-memory state
- `Replion` system replicates within a single server
- The `Machine.Type = "Duel"` marking is stored in the player's **local Synchronizer channel**
- No evidence of MemoryStoreService being used for cross-server duel state locking

#### 2. Item Locking During Duels

When a brainrot enters a duel:
```lua
-- From PlotClient670.luau line 265
brainrot.Machine = {
    Type = "Duel",
    Active = true
}
```

**However**, this lock is:
- Stored in the **Synchronizer channel** which is server-local
- Only replicated to clients connected to that specific server
- **NOT visible to other servers** (S2 in our scenario)

#### 3. What Happens During Server Freeze

**During S1 Freeze:**
1. Server S1's Lua VM stops executing
2. `PlayerRemoving` event does NOT fire (no clean disconnect)
3. Duel state remains "in progress" in S1's memory
4. Player data is **not saved** to DataStore

**When Account A Joins S2:**
```lua
-- From GameAnalytics73.luau line 466
local l_TeleportData_0 = v131:GetJoinData().TeleportData
local l_v8_PlayerData_0 = v8:GetPlayerData(v131)  -- Loads from DataStore
```

S2 loads Account A's data from DataStore, which:
- Contains the **last saved state** (before the duel started, or during early duel phases)
- Does **NOT** know about the active duel on S1
- Brainrot may appear **unlocked** (no `Machine.Type = "Duel"` marker in persisted data)

**When S1 Recovers:**
1. Duel timeout logic executes
2. Account B wins by forfeit
3. S1 attempts to transfer brainrot from A to B
4. S1 may still have the old state where A owns the brainrot

#### 4. Duplication Risk Assessment

**High Risk Scenario:**

```
Timeline:
T0: Duel starts on S1, brainrots locked in memory
T1: S1 freezes, A's data NOT saved with duel lock
T2: A joins S2, loads data from DataStore (no lock visible)
T3: A's brainrots appear normal on S2, can be traded/sold
T4: S1 recovers, B wins, S1 transfers A's brainrot to B
T5: Same brainrot now exists on BOTH S2 (A) and S1 (transferred to B)
```

**The duplication CAN occur if:**
1. Duel lock state is not persisted to DataStore before freeze
2. No cross-server validation via MemoryStore for brainrot ownership
3. DataStore writes for duel resolution don't check for concurrent sessions

#### 5. Missing Safeguards (Based on Visible Code)

The decompiled client-side code does not show evidence of:

| Safeguard | Status | Risk |
|-----------|--------|------|
| MemoryStore session locking | NOT VISIBLE | High - Player can exist on multiple servers |
| Cross-server brainrot lock | NOT VISIBLE | High - Same brainrot can be used on multiple servers |
| Atomic duel resolution | NOT VISIBLE | High - No transaction guarantee |
| UUID validation on transfer | NOT VISIBLE | Medium - Could accept stale UUIDs |
| Duplicate reward prevention | NOT VISIBLE | High - B could receive multiple rewards |

#### 6. Reconnection Logic Weakness

```lua
-- From DuelsMachineController194.luau line 457-485
v28.OnClientEvent:Connect(function(v129)  -- DuelsMachineService/Reconnect
    -- Shows reconnection prompt for 600 seconds (10 minutes)
    local v133 = v15:Show(
        "You disconnected an active duel with @" .. l_result_3.Username,
        600,
        "ReconnectTemplate"
    );
```

**The reconnection system:**
- Waits for player to rejoin and prompts them
- But the **prompt is client-side initiated**
- Server-side duel resolution may proceed independently
- No evidence of server-side blocking until reconnection timeout

### 7. Answer to Core Questions

**Q1: Will this lead to a dupe of the good item?**

**Answer: LIKELY YES** - Based on the visible code, the following issues create duplication risk:

1. **No cross-server lock**: The `Machine.Type = "Duel"` marker is in the per-server Synchronizer, not in a global MemoryStore
2. **DataStore race condition**: When A joins S2, their data loads from the last save point (which may not include the duel lock)
3. **No atomic resolution**: Duel resolution on S1 and profile loading on S2 are independent operations
4. **Session overlap**: Roblox doesn't guarantee single-server presence during network issues

**Q2: What prevents multiple reward distribution to B?**

**Visible safeguards: NONE** - The client code shows reward distribution but no de-duplication mechanism is visible. If S1's Lua VM restarts or re-executes the duel completion logic, B could receive multiple copies.

### 8. Recommendations for Fix

```lua
-- RECOMMENDED: Add MemoryStore-based global lock
local DuelsMemoryStore = MemoryStoreService:GetHashMap("ActiveDuels")

-- Before duel starts:
DuelsMemoryStore:SetAsync(brainrotUUID, {
    ownerId = player.UserId,
    duelId = duelId,
    serverJobId = game.JobId,
    expiry = os.time() + 3600
}, 3600)

-- Before loading player data on any server:
local lockData = DuelsMemoryStore:GetAsync(brainrotUUID)
if lockData and lockData.serverJobId ~= game.JobId then
    -- Brainrot is locked in a duel on another server
    -- Either block action or force reconnection
end

-- On duel resolution (ATOMIC):
DuelsMemoryStore:UpdateAsync(brainrotUUID, function(currentValue)
    if currentValue and currentValue.duelId == duelId then
        -- Perform transfer
        return nil  -- Remove lock
    end
    return currentValue  -- Don't modify if state changed
end)
```

### 9. Summary

| Question | Answer |
|----------|--------|
| Can duplication occur? | **YES** - High likelihood based on visible architecture |
| Is duel resolution atomic? | **NO** - No visible cross-server transaction mechanism |
| Are items globally locked? | **NO** - Locks are server-local via Synchronizer |
| Can B receive multiple rewards? | **POSSIBLY** - No visible de-duplication |
| What prevents dual-server presence? | **NOTHING VISIBLE** - Standard Roblox session management only |

**Severity: CRITICAL** - This represents a potential economy-breaking exploit that could allow systematic duplication of high-value items through coordinated server manipulation.

---

## Anti-Duplication System Analysis

This section analyzes the likely architecture of the anti-dupe system and potential bypass vectors.

### 1. Reasonable Assumptions About Anti-Dupe Mechanism

Based on visible code patterns and common Roblox game architecture:

#### 1.1 UUID-Based Item Identification

Evidence from codebase:
```lua
-- From Asserts909.luau lines 1665-1692
v72.UUIDStripped = function(v455)
    -- Validates 32-character hex string (UUID without dashes)
    if string.len(v455) ~= 32 then error("Length32", 2) end
    -- Validates lowercase hex characters only
end

v72.UUID = function(v459)
    -- Validates standard 36-character UUID format
    if string.len(v459) ~= 36 then error("Length36", 2) end
    if not v459:find("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
        error("UUID", 2)
    end
end
```

**Assumption**: Each brainrot has a unique UUID generated via `HttpService:GenerateGUID()` at creation time:
```lua
-- From LaserGunsShared664.luau - Example of GUID generation pattern
Id = l_HttpService_0:GenerateGUID(false):lower():gsub("%-", "")
```

#### 1.2 Brainrot Data Structure (Inferred)

```lua
Brainrot = {
    UUID = "abc123def456...",      -- 32-char unique identifier
    Index = "Tralalero",           -- Brainrot type
    Mutation = "Rainbow",          -- Optional mutation
    Traits = {"10B", "Lightning"}, -- Array of traits
    CreatedAt = timestamp,         -- Creation timestamp
    OriginServer = jobId,          -- Server where created (likely)
    OwnerHistory = {userId1, ...}, -- Ownership chain (likely)
    LastTransferTime = timestamp   -- Anti-rapid-trade check (likely)
}
```

#### 1.3 Likely Anti-Dupe Detection Points

| Detection Point | Mechanism | Timing |
|-----------------|-----------|--------|
| **On Creation** | UUID uniqueness check against global registry | Immediate |
| **On Player Join** | Compare loaded UUIDs against MemoryStore/global registry | During data load |
| **On Transfer** | Verify sender actually owns UUID, update global registry atomically | During duel resolution |
| **Periodic Scan** | Background job scanning for duplicate UUIDs across DataStore shards | Every N minutes |
| **On Trade/Sell** | Re-validate UUID ownership before transaction | Pre-transaction |

### 2. When Duplication Is Detected

Based on architectural patterns, detection likely occurs at:

#### 2.1 Player Join Reconciliation (PRIMARY)

```lua
-- Hypothetical server-side logic
function OnPlayerJoin(player)
    local playerData = DataStore:GetAsync(player.UserId)
    
    for podiumIndex, brainrot in playerData.AnimalPodiums do
        if brainrot and brainrot.UUID then
            -- Check against global UUID registry
            local existingOwner = MemoryStore:GetAsync("UUID:" .. brainrot.UUID)
            
            if existingOwner and existingOwner.ownerId ~= player.UserId then
                -- DUPLICATE DETECTED
                -- Delete this copy, keep the one in registry
                playerData.AnimalPodiums[podiumIndex] = nil
                LogDupeAttempt(player, brainrot)
            else
                -- Register/refresh ownership
                MemoryStore:SetAsync("UUID:" .. brainrot.UUID, {
                    ownerId = player.UserId,
                    serverId = game.JobId,
                    timestamp = os.time()
                }, 86400)  -- 24-hour TTL
            end
        end
    end
end
```

#### 2.2 Duel Resolution (SECONDARY)

```lua
-- Hypothetical duel completion logic
function ResolveDuel(winnerId, loserId, brainrotUUID)
    -- Atomic ownership transfer using UpdateAsync
    local success = MemoryStore:UpdateAsync("UUID:" .. brainrotUUID, function(current)
        if not current then
            return nil  -- UUID not registered, abort
        end
        
        if current.ownerId ~= loserId then
            return nil  -- Loser doesn't own this UUID, abort (possible dupe)
        end
        
        -- Transfer ownership
        return {
            ownerId = winnerId,
            serverId = game.JobId,
            timestamp = os.time(),
            previousOwner = loserId
        }
    end)
    
    return success
end
```

### 3. How The System Decides Which Copy To Delete

#### 3.1 Registry-Based Authority

The system likely uses a **"first to register wins"** model:

```
UUID Registry (MemoryStore HashMap)
├── Key: "UUID:abc123def456"
│   └── Value: {ownerId: 12345, serverId: "job-xyz", timestamp: 1705678900}
├── Key: "UUID:def789ghi012"  
│   └── Value: {ownerId: 67890, serverId: "job-abc", timestamp: 1705678800}
└── ...
```

**Deletion Logic:**
1. When Player A joins S2, their brainrot UUID is checked against registry
2. If registry says UUID belongs to someone else → **DELETE this copy**
3. If registry says UUID belongs to Player A → Keep, refresh timestamp
4. If UUID not in registry → Register it (legacy migration or new creation)

#### 3.2 Timestamp Tiebreaker

When both copies claim validity:
```lua
-- Hypothetical conflict resolution
if registryEntry.timestamp > localData.LastSaveTime then
    -- Registry is more recent, delete local copy
    deleteLocalCopy()
elseif localData.LastSaveTime > registryEntry.timestamp then
    -- Local is more recent (edge case), update registry
    updateRegistry(localData)
else
    -- Exact tie: prefer the one currently in registry (stability)
    deleteLocalCopy()
end
```

#### 3.3 Server JobId Verification

```lua
-- If UUID claims to be active on another server, verify that server exists
if registryEntry.serverId and registryEntry.serverId ~= game.JobId then
    local serverAlive = MessagingService:PublishAsync("PingServer", registryEntry.serverId)
    if not serverAlive then
        -- Original server is dead, we can claim this UUID
        takeOwnership()
    else
        -- Original server is alive, this is a duplicate
        deleteDuplicate()
    end
end
```

### 4. Exploit Bypass Vectors

#### 4.1 Race Condition Window Attack

**The Core Vulnerability:**
```
Timeline:
T0: Duel starts, UUID locked in S1 memory only (not MemoryStore)
T1: S1 freezes before writing lock to MemoryStore
T2: A joins S2, loads data - UUID NOT in MemoryStore registry
T3: S2 registers UUID to A (appears legitimate)
T4: S1 recovers, also registers UUID to B (overwrites or fails)
T5: Both have valid registry claims at different times
```

**Attack Tools:**
- **Synapse X / Script-Ware**: Inject code to simulate network lag
- **Clumsy / WinDivert**: Drop/delay specific packets
- **Charles Proxy**: Intercept and hold network requests
- **VM Freeze**: Suspend VM at precise moment

#### 4.2 Forced Disconnect Timing

**Exploit Flow:**
1. Attacker A initiates duel with accomplice B
2. A contributes high-value brainrot
3. At exact moment of duel acceptance, A force-disconnects
4. A immediately rejoins on S2 before S1 processes disconnect
5. S1 may timeout and award B the brainrot
6. S2 loaded A's data before the transfer completed

**Tools:**
```lua
-- Client-side disconnect simulation (requires exploit)
game:GetService("NetworkClient"):Disconnect()
-- Or kill Roblox process and relaunch
```

#### 4.3 DataStore Replication Lag Abuse

**Roblox DataStore Limitation:**
- `SetAsync` is eventually consistent
- Writes can take 1-5 seconds to propagate
- `GetAsync` may return stale data during this window

**Attack:**
```
T0: Duel resolves on S1, DataStore write initiated
T1: Before write completes, A joins S2
T2: S2's GetAsync returns OLD data (before transfer)
T3: S1's write completes (A no longer owns brainrot)
T4: S2 has old data showing A still owns brainrot
T5: S2's eventual save writes old data BACK, overwriting S1's transfer
```

#### 4.4 MemoryStore Expiration Attack

**If anti-dupe uses MemoryStore with TTL:**
```lua
MemoryStore:SetAsync("UUID:xxx", ownerData, 3600)  -- 1 hour TTL
```

**Attack:**
1. Win a brainrot in duel
2. Wait until MemoryStore entry expires (1 hour)
3. Original owner rejoins, their data loads
4. UUID no longer in MemoryStore → considered "unregistered"
5. Both players now have "valid" brainrots

#### 4.5 Multi-Account Session Overlap

**Attack Setup:**
- Account A on PC (Server S1)
- Account A on Mobile (Server S2) - same Roblox account

**Roblox Behavior:**
- When A joins S2, S1 receives kick signal
- But network latency means A exists briefly on both

**Exploit:**
1. A on S1 enters duel, brainrot locked
2. A's mobile joins S2 at same time
3. S2 loads A's data while S1 still processing duel
4. Race condition in anti-dupe registry

### 5. Classes of Exploit Tools and Bypass Methods

| Tool Category | Examples | Bypass Mechanism |
|---------------|----------|------------------|
| **Network Manipulation** | Clumsy, WinDivert, NetLimiter | Delay/drop packets to create timing windows |
| **Process Control** | Process Hacker, Cheat Engine | Freeze Roblox process at critical moments |
| **Script Executors** | Synapse X, Script-Ware, Krnl | Inject code to manipulate client state |
| **Proxy Interceptors** | Charles, Fiddler, mitmproxy | Hold/replay/modify network traffic |
| **VM Software** | VMware, VirtualBox | Snapshot/restore VM state, pause execution |
| **Multi-Instance** | Roblox Account Manager | Run multiple accounts simultaneously |
| **Timing Tools** | AutoHotkey, macro software | Precise timing of disconnect/reconnect |

### 6. Defensive Recommendations

#### 6.1 Immediate Fixes

```lua
-- Use MemoryStore for ALL duel state (not just local Synchronizer)
local function StartDuel(player1, player2, brainrot1UUID, brainrot2UUID)
    -- ATOMIC lock both brainrots BEFORE duel starts
    local lock1 = MemoryStore:UpdateAsync("UUID:" .. brainrot1UUID, function(current)
        if current and current.ownerId ~= player1.UserId then
            return nil  -- Not owner, abort
        end
        if current and current.inDuel then
            return nil  -- Already in duel, abort
        end
        return {
            ownerId = player1.UserId,
            inDuel = true,
            duelId = duelId,
            duelServer = game.JobId,
            lockTime = os.time()
        }
    end)
    
    if not lock1 then
        -- Failed to lock, abort duel
        return false, "Brainrot is unavailable"
    end
    
    -- Same for brainrot2
    -- ...
end
```

#### 6.2 Server Join Validation

```lua
-- On every server join, validate ALL brainrots against MemoryStore
game.Players.PlayerAdded:Connect(function(player)
    local data = LoadPlayerData(player)
    
    for i, brainrot in data.AnimalPodiums do
        if brainrot and brainrot.UUID then
            local registryEntry = MemoryStore:GetAsync("UUID:" .. brainrot.UUID)
            
            if registryEntry then
                if registryEntry.ownerId ~= player.UserId then
                    -- DUPLICATE - Delete this one
                    data.AnimalPodiums[i] = nil
                    Analytics:Track("DupeDeleted", player.UserId, brainrot.UUID)
                    
                elseif registryEntry.inDuel and registryEntry.duelServer ~= game.JobId then
                    -- Brainrot is in a duel on another server
                    -- Either block or force reconnect to duel server
                    TeleportToServer(player, registryEntry.duelServer)
                end
            end
        end
    end
end)
```

#### 6.3 Atomic Duel Resolution

```lua
-- Use DataStore:UpdateAsync for atomic ownership transfer
function ResolveDuelAtomic(winnerId, loserId, brainrotUUID)
    -- Step 1: Atomic MemoryStore update
    local memSuccess = MemoryStore:UpdateAsync("UUID:" .. brainrotUUID, function(current)
        if not current or current.ownerId ~= loserId then
            return nil  -- Invalid state, abort
        end
        return {
            ownerId = winnerId,
            inDuel = false,
            transferTime = os.time(),
            previousOwner = loserId
        }
    end)
    
    if not memSuccess then
        return false, "Transfer failed - ownership mismatch"
    end
    
    -- Step 2: Update both players' DataStores atomically
    -- Remove from loser
    DataStore:UpdateAsync("Player:" .. loserId, function(data)
        for i, brainrot in data.AnimalPodiums do
            if brainrot and brainrot.UUID == brainrotUUID then
                data.AnimalPodiums[i] = nil
                break
            end
        end
        return data
    end)
    
    -- Add to winner
    DataStore:UpdateAsync("Player:" .. winnerId, function(data)
        table.insert(data.AnimalPodiums, {
            UUID = brainrotUUID,
            -- other brainrot data
        })
        return data
    end)
    
    return true
end
```

### 7. Summary: Anti-Dupe Bypass Likelihood

| Bypass Vector | Difficulty | Success Rate | Detection Risk |
|---------------|------------|--------------|----------------|
| Server freeze timing | Hard | Medium | Low if done once |
| Force disconnect race | Medium | Medium-High | Medium |
| DataStore replication lag | Easy | Low-Medium | High |
| MemoryStore expiration | Very Easy | Depends on TTL | Low |
| Multi-account overlap | Easy | Medium | Medium |
| Network packet manipulation | Medium | High | Low |

**Overall Assessment**: If the anti-dupe system relies primarily on **player join reconciliation** without **real-time MemoryStore locks during duels**, the system is vulnerable to timing-based duplication exploits. The ~60 second profile loading window mentioned in the scenario is particularly dangerous as it creates a substantial race condition window.

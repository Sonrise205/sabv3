local function _() --[[ Line: 1 ]] --[[ Name: inline_test ]]
    return debug.info(1, "n");
end;
return {
    strict = not (debug.info(1, "n") ~= "inline_test"), 
    batch = false
};
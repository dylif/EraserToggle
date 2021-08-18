-- Register all Toolbar actions and intialize all UI stuff
function initUi()
    print("EraserToggle: initUi called\n");
    app.registerUi({["menu"] = "Toggle Eraser", ["callback"] = "toggleEraser", ["accelerator"] = "<Control>t"});
    app.registerUi({["menu"] = "Force Pen Selected", ["callback"] = "forcePen"});
    print("EraserToggle registered\n");

    -- Initialize default state
    penEnabled = true;
end

-- Toggle the current tool (according to penEnabled)
function toggleEraser()
    penEnabled = not penEnabled;
    app.uiAction({["action"] = "ACTION_TOOL_PEN", ["enabled"] = penEnabled});
    app.uiAction({["action"] = "ACTION_TOOL_ERASER", ["enabled"] = not penEnabled});
end

-- Force the pen to be selected (reset state)
function forcePen()
    penEnabled = true;
    app.uiAction({["action"] = "ACTION_TOOL_PEN", ["enabled"] = true});
    app.uiAction({["action"] = "ACTION_TOOL_ERASER", ["enabled"] = false});
end

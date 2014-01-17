function GUI
    hFig = figure('Visible','off', 'Menu','none', 'Name','Calculator', 'Resize','off', 'Position',[100 100 570 650]);
    movegui(hFig,'center')          %# Move the GUI to the center of the screen

    hBtnGrp = uibuttongroup('Position',[0 0 0.3 1], 'Units','Normalized');
    uicontrol('style','Text','String','Image:','Position',[5 620 70 20]);
    uicontrol('Style','Radio', 'Parent',hBtnGrp, 'HandleVisibility','off', 'Position',[10 590 30 30], 'String','1', 'Tag','images/concordorthophoto.png')
    uicontrol('Style','Radio', 'Parent',hBtnGrp, 'HandleVisibility','off', 'Position',[40 590 30 30], 'String','2', 'Tag','-')
    uicontrol('Style','Radio', 'Parent',hBtnGrp, 'HandleVisibility','off', 'Position',[70 590 30 30], 'String','3', 'Tag','*')
    uicontrol('Style','Radio', 'Parent',hBtnGrp, 'HandleVisibility','off', 'Position',[10 560 30 30], 'String','4', 'Tag','/')
    uicontrol('Style','Radio', 'Parent',hBtnGrp, 'HandleVisibility','off', 'Position',[40 560 30 30], 'String','5', 'Tag','/')
    uicontrol('Style','Radio', 'Parent',hBtnGrp, 'HandleVisibility','off', 'Position',[70 560 30 30], 'String','6', 'Tag','/')

    uicontrol('Style','pushbutton', 'String','Load', 'Position',[110 565 50 50], 'Callback',{@load_callback})

    axes('Position',[70 500 30 30]);

    hEdit1 = uicontrol('Style','edit', 'Position',[150 150 60 20], 'String','10');
    hEdit2 = uicontrol('Style','edit', 'Position',[250 150 60 20], 'String','20');
    hEdit3 = uicontrol('Style','edit', 'Position',[200  80 60 20], 'String','');

    set(hFig, 'Visible','on')        %# Make the GUI visible

    %# callback function
    function load_callback(src,ev)
        v1 = str2double(get(hEdit1, 'String'));
        v2 = str2double(get(hEdit2, 'String'));
        switch get(get(hBtnGrp,'SelectedObject'),'Tag')
            case '+',  res = v1 + v2;
            case '-',  res = v1 - v2;
            case '*',  res = v1 * v2;
            case '/',  res = v1 / v2;
            otherwise, res = '';
        end
        set(hEdit3, 'String',res)
    end
end
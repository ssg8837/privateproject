function openLogicShow(loginid_val, mapid_val) {
    var form = document.createElement("form");
    form.setAttribute("action", 'openLogicShow');
    form.setAttribute("method",'post');
    var loginid = document.createElement("input");
    loginid.setAttribute("type", "hidden");
    loginid.setAttribute("name", "userid");
    loginid.setAttribute("value", loginid_val);
    form.appendChild(loginid);
    var mapid = document.createElement("input");
    mapid.setAttribute("type", "hidden");
    mapid.setAttribute("name", "mapid");
    mapid.setAttribute("value", mapid_val);
    form.appendChild(mapid);
    document.body.appendChild(form);
    form.submit();
}
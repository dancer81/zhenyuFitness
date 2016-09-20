function ifPagePermitted(o) {
    var urlAbsolute = getUrlAbsolute(o.href);
    //alert(urlAbsolute);
    //ajax判断权限

    return true;
}

function getUrlAbsolute(url) {
    var s = url.split("?");
    if (s.length < 1) {
        return;
    }
    else {
        s = s[0];
        //zhenyuFitness
        var start = s.indexOf("/zhenyuFitness");
        s = s.substring(start);
        return s;
    }
}

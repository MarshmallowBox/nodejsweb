module.exports = {
    HTML: function (title, list, body, control, map, latitude, longtitude) {
        return `
            <!doctype html>
                <html>
                <head>
                    <title>Illusion Company - ${title}</title>
                    <meta charset="utf-8">
                    <link rel="stylesheet" href="https://jo0196.github.io/thunder.css">
                    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
                    <link rel="stylesheet" href="https://jo0196.github.io/table.css">
                    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
                </head>
                <body>
                    <style>
                    textarea{
                        width:25rem;
                        height:10rem;
                     }
                    </style>

                    <h1><a href="/">Thunder Company</a></h1>
                    
                    ${list}
                    ${control}
                    ${body}
                    ${map}
                    <script defer="" src="https://code.getmdl.io/1.3.0/material.min.js"></script>
                    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
                    <script src="https://www.gstatic.com/firebasejs/4.5.2/firebase.js"></script>
                    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
                </body>
            </html>
        `;
    },
    List: function (filelist) {
        var list = '<ul>';
        var i = 0;
        while (i < filelist.length) {
            list += `<li><a href="/?id=${filelist[i]}">${filelist[i]}</a></li>`
            i++;
        }
        list = list + '</ul>';
        return list;
    },
    Listrds: function (filelist) {
        var list = '<ul>';
        var i = 0;
        while (i < filelist.length) {
            list += `<li><a href="/?id=${filelist[i].title}">${filelist[i].title}</a></li>`
            i++;
        }
        list = list + '</ul>';
        return list;
    },
    // Marker:function (){
    //     var marker = "";
    //     for()
    //     var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
    // }
}
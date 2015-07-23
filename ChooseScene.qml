import qmlweb.components

Item {
    //text: "Viewlang позволяет создавать трехмерные сцены на языке QML."
    id: scen

    Text {
        font.pixelSize:15
        text: "Qmlweb.Run"
        x: cols.x
        y: parent.height/4
    }


    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height/3
        spacing: 10
        id: cols

        Row {
          spacing: 7

            TextField {
                id: inp
                placeholderText: "Enter URL to qml file (links to github files are allowed)"
                width: 500
                onAccepted: btn.clicked()
            }

            Button {
                id: btn

                text: inp.text && inp.text.length > 30 ? "GO" : "Go"
                width:100
                onClicked: {
                    var dpos = window.location.href.indexOf("#");
                    var loc = dpos >= 0 ? window.location.href.slice( 0, dpos) : window.location.href;
                    var s = loc.replace("s--","q--");
                    s = s.replace("s=","sold=");
                    window.open( s + "?s=" + encodeURIComponent(inp.text) );
                }
            }

        }

    }

}


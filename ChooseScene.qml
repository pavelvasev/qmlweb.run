import qmlweb.components

Item {
    //text: "http://pavelvasev.github.io/qmlweb.run/"
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

        Row {
            spacing: 5

            Text {
                y: 3
                text: "Examples:"
            }

            Button {
                width: 150
                text: "QmlWeb own tests"
                onClicked: inp.text = "QmlwebTestsViewer.qml";
            }

            Button {
                width: 180
                text: "Qmlweb.components tests"
                onClicked: {
                    inp.text = "https://github.com/pavelvasev/qmlweb.components/blob/master/src/test/Index.qml"
                }
            }

            Button {
                width: 90
                text: "Gist red rect"
                onClicked: {
                    inp.text = "https://gist.github.com/pavelvasev/21659c30797720842cee"
                }
            }


        } // row of tests

        Text {
            property var tag: "left"
            font.pixelSize: 12
            text:   "Qmlweb.Run may run links from github and <a target='_blank' href='https://gist.github.com/'>gist</a>.\n"+
                    "Use this JS-bookmark to run file in Qmlweb.Run: "+
                    "<a href='javascript:(function(){window.location.href=\"http://pavelvasev.github.io/qmlweb.run/?s=\"+window.location.href.toString(); } )()'>See in Qmlweb.Run</a>"
        }

    } // column
}


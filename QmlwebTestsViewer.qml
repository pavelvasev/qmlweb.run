//import "https://github.com/pavelvasev/qmlweb.components"
import qmlweb.components

Item {

  property var qmlwebTestsUrl: "qmlweb/test/testpad/"
  property var files: JSON.parse(getUrlContents( Qt.resolvedUrl( qmlwebTestsUrl+"files.json") ));
  
  Row {
    x: 10
    y: 10
    z: 10
    spacing: 5

    Text {
      y:3
      text: "QmlWeb tests runner. Choose test:"
    }
  
    ComboBox {
      model: files.map( function(e) { return e.title; } )
      id: combo
    }

    Text {
      text: "<a target='_blank' href='"+selectedSrc+"'>open test source</a>"
    }
  }
  
  property var selectedSrc: { 
      //console.log(combo.currentIndex, files[ combo.currentIndex ]);
      var s = qmlwebTestsUrl + files[ combo.currentIndex ].file;
      var ss = Qt.resolvedUrl( s );
      return s ? Qt.resolvedUrl( s ) : ""
    }

  Loader {
    id: loader
    source: selectedSrc
    onSourceChanged: console.log("using source",source);

    y: 40
    width: parent.width
    height: parent.height-y
  }

}
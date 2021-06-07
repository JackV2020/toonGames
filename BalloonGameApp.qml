//
// BalloonGame v1.0.0 by Oepi-Loepi
//

import QtQuick 2.1
import qb.components 1.0
import qb.base 1.0;

App {
	id: balloonGameApp

	property url tileUrl : "BalloonGameTile.qml"
	property url thumbnailIcon: "qrc:/tsc/onkyo-resize.png"

	property url balloonGameScreenUrl : "BalloonGameScreen.qml"
	property BalloonGameScreen balloonGameScreen

	function init() {
		registry.registerWidget("tile", tileUrl, this, null, {thumbLabel: qsTr("Game"), thumbIcon: thumbnailIcon, thumbCategory: "general", thumbWeight: 30, baseTileWeight: 10, thumbIconVAlignment: "center"});
        	registry.registerWidget("screen", balloonGameScreenUrl, this, "balloonGameScreen");
	}

}

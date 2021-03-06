//Balloon by Oepi-Loepi for Toon

import QtQuick 2.1


Item {
    id: melon

// ---------------------------------------------------------------------
//  the next disables collision detect while exploding
    property bool exploding : false
// ---------------------------------------------------------------------

    property bool destroyed: false

        width: 240
        height: 240


    Item {
        id: sprite
        property int frame:1

        anchors.centerIn: parent

        height: parent.height
        width: parent.height
        clip: true

        transform: Rotation {
            id: rotator

            origin {
                x: 60
                y: 110
             }
             angle: 0
        }

        SequentialAnimation {
            id: shake
            PropertyAnimation { easing.type: Easing.InQuad; duration: 400; target: rotator; property: "angle"; to: 10 }
            PropertyAnimation { easing.type: Easing.InQuad; duration: 400; target: rotator; property: "angle"; to: -10 }
        }

        Timer {
// only shake on Toon 2
            running: isNxt
            repeat: true
            interval: 800

            onTriggered: {
                shake.restart();
            }
        }

        Image {
            id: spriteImage
            source: "file:///qmf/qml/apps/toonGames/drawables/ToonGamesBalloonWatermelonSpritesheet.png"
            y: 0
            x:-120-(240*sprite.frame)
        }
    }

    Timer {
        id: animation;
        repeat: true;
        interval: 80;
        onTriggered: {
// Toon 1 shorter explosion            if (sprite.frame == 9) {
            if (sprite.frame == ( isNxt ? 9 : 7 ) ) {
                gameScreen.score += 50;
                animation.stop()
                game.removeMelon(melon);
                melon.destroy();
            }
            sprite.frame++;
        }
    }

    function explode() {
        if (!destroyed) {
            sprite.frame = 2;
            animation.start();
        }
        destroyed = true;
    }

    function randomNumber(from, to) {
       return Math.floor(Math.random() * (to - from + 1) + from);
    }

// move a little bit faster on Toon 1 because Toon 1 is slower
    property int speed: isNxt ? randomNumber(3, 8) : randomNumber(3, 8) * 2

    Timer {
        interval: 50
        running: true
        repeat: true

        onTriggered: {
            melon.y -= melon.speed;

            if (melon.y + melon.height < 0) {
                game.removeMelon(melon);
                melon.destroy();
            }

            if (!exploding) {

                var dart = game.getDartPosition();

//              if       dart tip passed left side melon                 AND  dart tail before right side melon
//                  AND  dart middle below melon top                     AND  dart middle above bolloon bottom

                var melonHeartX = melon.x + melon.width  / 2
                var melonHeartY = melon.y + melon.height / 2

                var hitRadius = melon.width / 6

                if     ( ( ( dart.x + dart.width )          > ( melonHeartX - hitRadius ) )  && (   dart.x                         < ( melonHeartX + hitRadius ) ) ) {
                    if ( ( ( dart.y + ( dart.height / 2 ) ) > ( melonHeartY - hitRadius ) )  && ( ( dart.y + ( dart.height / 2 ) ) < ( melonHeartY + hitRadius ) ) ) {
                        exploding = true
                        explode()
                    }
                }
            }
        }
    }
}

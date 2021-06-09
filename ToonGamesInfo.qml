/*

Info

Version 1.0.0 
Info screen for the games

Select a snake of the same numbers and click collect.
Your score will be the count of numbers x the value of the numbers.
All selected numbers will vanish and everything on top will move down.
The last number selected however stays and gets upgraded by 1.
To cancel a selection select something else.


*/

import QtQuick 2.1
import qb.components 1.0
import BasicUIControls 1.0

Screen {
    id                          : toonGamesInfo

    screenTitle                 : qsTr(me)

// ---------------------------------------------------------------------

    property string me          : "Info on the Toon Game Center games"
    
    property string colortxt    : "black"
    property string color0      : "green"
    property string color1      : "red"
    property string color2      : "yellow"
    property string color3      : "lightgrey"
    property string color4      : "cyan"

    property int margin         : isNxt ? 30 : 24

// ---------------------------------------------------------------------

    Rectangle {
    
        height                  : parent.height - 20
        width                   : parent.width - 40
        anchors {
            horizontalCenter    : parent.horizontalCenter
            verticalCenter      : parent.verticalCenter
        }
        color                   : color0
    
// --------------------------------------------------------- info field

        YaLabel {
            id                  : info
            buttonText          : 
"
Tic Tac Toe for 2 players, tic tac toe as you know it.\n
Slide, 1 player, sort the numbers 1..15 in rows from top to bottom.\n
Memory, 2 players, click 2 tiles and collect a pair or put them back by clicking again.\n
4 In A Row, 2 players, 4 in a row as you know it. Pick up coins and drop them in the rack.\n
Hangman, 2 players, fill in 2 secret words and start guessing what is in the ****** text.\n
Mines, 2 players, mines as you know it but for 2 players. Changes turn after guessing.\n
Numbers, 1 player, collect snake of same numbers, last gets upgraded, others fall down.\n 
............................Games for 2 players let you enter names for the players............................
"
            
            height              : parent.height - 20
            width               : parent.width - 40
            buttonActiveColor   : buttonSelectedColor
            buttonHoverColor    : buttonSelectedColor
            buttonSelectedColor : color3
            selected            : true
            enabled             : true
            textColor           : colortxt
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter  : parent.verticalCenter
            }
            pixelsizeoverride   : true
           pixelsizeoverridesize: isNxt ? 20 : 16
           onClicked            : { hide() }
        }
        
// ---------------------------------------------------------------------

        Image {
            id                      : imgGames
            anchors {
                top                 : parent.top
                right               : parent.right
                topMargin           : isNxt ? 20 : 16
                rightMargin         : isNxt ? 30 : 24
            }        
            source                  : "file:///qmf/qml/apps/toonGames/drawables/toonGames.png"
            height                  : parent.height / 4
            width                   : parent.height / 4
        }

// ---------------------------------------------------------------------

    }
}


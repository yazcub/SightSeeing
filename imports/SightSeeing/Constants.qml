/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the documentation of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

pragma Singleton
import QtQuick 2.11

QtObject {
    readonly property int width: 400
    readonly property int height: 600


    ///////// Font icon loader /////////
    property FontLoader fontRegularLoader: FontLoader {
        id: fontRegularLoader
        source: "./fa-regular-400.ttf"
    }
    readonly property alias fontRegularFamily: fontRegularLoader.name

    ///////// Font brand loader /////////
    property FontLoader fontBrandLoader: FontLoader {
        id: fontBrandLoader
        source: "./fa-brands-400.ttf"
    }
    readonly property alias fontBrandFamily: fontBrandLoader.name

    ///////// Font solid loader /////////
    property FontLoader fontSolidLoader: FontLoader {
        id: fontSolidLoader
        source: "./fa-solid-900.ttf"
    }
    readonly property alias fontSolidFamily: fontSolidLoader.name

    ///////// Font text loader /////////
    property FontLoader fontTextLoader: FontLoader {
        id: fontTextLoader
        source: "./Lato/Lato-Light.ttf"
    }
    readonly property alias fontTextFamily: fontTextLoader.name

    ///////// Font text loader Lato-Regular.ttf /////////
    property FontLoader fontTextRegularLoader: FontLoader {
        id: fontTextRegularLoader
        source: "./Lato/Lato-Regular.ttf"
    }
    readonly property alias fontTextRegularFamily: fontTextRegularLoader.name


    ///////// Font text loader OpenSans-Regular.ttf /////////
    property FontLoader fontOpenSansRegularLoader: FontLoader {
        id: fontOpenSansRegularLoader
        source: "./Open_Sans/OpenSans-Regular.ttf"
    }
    readonly property alias fontOpenSansRegularFamily: fontOpenSansRegularLoader.name

    ///////// Font text loader poppins-regular.ttf /////////
    property FontLoader fontPoppinsRegularLoader: FontLoader {
        id: fontPoppinsRegularLoader
        source: "./Poppins/Poppins-Regular.ttf"
    }
    readonly property alias fontPoppinsRegularFamily: fontPoppinsRegularLoader.name

    ///////// Font text loader signika-regular.ttf /////////
    property FontLoader fontSignikaRegularLoader: FontLoader {
        id: fontSignikaRegularLoader
        source: "./Signika/Signika-Regular.ttf"
    }
    readonly property alias fontSignikaRegularFamily: fontSignikaRegularLoader.name

    ///////// Font text loader tittiliumweb-regular.ttf /////////
    property FontLoader fontTittiliumWebRegularLoader: FontLoader {
        id: fontTittiliumWebRegularLoader
        source: "./Titillium_Web/TitilliumWeb-Regular.ttf"
    }
    readonly property alias fontTittiliumWebRegularFamily: fontTittiliumWebRegularLoader.name

    ///////// Font text loader comfortaa-regular.ttf /////////
    property FontLoader fontComfortaaRegularLoader: FontLoader {
        id: fontComfortaaRegularLoader
        source: "./Comfortaa/Comfortaa-Regular.ttf"
    }
    readonly property alias fontComfortaaRegularFamily: fontComfortaaRegularLoader.name


    function guid() {
      function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
          .toString(16)
          .substring(1);
      }
      return s4() + s4() + s4() + s4() + s4();
//        return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
    }


    readonly property string brand: "brand"
    readonly property string solid: "solid"
    readonly property string regular: "regular"

    readonly property int bottomMargin: 30

    readonly property int buttonsizes_width:  59  //69
    readonly property int buttonsizes_height: 59 //69

    readonly property int left: 0
    readonly property int right: 1

    readonly property int up: 0
    readonly property int down: 1





//    readonly property color backgroundColor: "#443224"
//    readonly property int defaultMargin: 8
}

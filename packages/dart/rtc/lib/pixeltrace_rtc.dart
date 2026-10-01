/// Browser WebRTC negotiation helpers.
library;

export 'src/web/rtc.dart'
    show
        RtcConnectResult,
        buildOfferSdp,
        waitForConnection,
        waitForIceGathering;

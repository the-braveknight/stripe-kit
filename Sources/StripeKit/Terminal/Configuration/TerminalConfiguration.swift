//
//  TerminalConfiguration.swift
//
//
//  Created by Andrew Edwards on 5/17/23.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public struct TerminalConfiguration: Codable {
    /// Unique identifier for the object.
    public var id: String
    /// An object containing device type specific settings for BBPOS WisePad 3
    public var bbposWisepad3: TerminalConfigurationBbposWisepad3?
    /// An object containing device type specific settings for BBPOS WisePOS E
    public var bbposWiseposE: TerminalConfigurationBbposWiseposE?
    /// An object containing device type specific settings for the Stripe Reader S700
    public var stripeS700: TerminalConfigurationStripeS700?
    /// An object containing device type specific settings for the Stripe Reader S710
    public var stripeS710: TerminalConfigurationStripeS710?
    /// An object containing device type specific settings for Verifone M425
    public var verifoneM425: TerminalConfigurationVerifoneM425?
    /// An object containing device type specific settings for Verifone P400
    public var verifoneP400: TerminalConfigurationVerifoneP400?
    /// An object containing device type specific settings for Verifone P630
    public var verifoneP630: TerminalConfigurationVerifoneP630?
    /// An object containing device type specific settings for Verifone UX700
    public var verifoneUx700: TerminalConfigurationVerifoneUx700?
    /// An object containing device type specific settings for Verifone V660p
    public var verifoneV660p: TerminalConfigurationVerifoneV660p?
    /// An object containing the cellular connectivity settings.
    public var cellular: TerminalConfigurationCellular?
    /// Whether this Configuration is the default for your account
    public var isAccountDefault: Bool?
    /// String indicating the name of the Configuration object, set by the user.
    public var name: String?
    /// An object containing the offline collection settings.
    public var offline: TerminalConfigurationOffline?
    /// Reader-specific security settings.
    public var readerSecurity: TerminalConfigurationReaderSecurity?
    /// Reboot time settings for readers that support customized reboot time configuration.
    public var rebootWindow: TerminalConfigurationRebootWindow?
    /// On-reader tipping settings
    public var tipping: TerminalConfigurationTipping?
    /// An object containing the WiFi network settings.
    public var wifi: TerminalConfigurationWifi?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    public var livemode: Bool

    public init(id: String,
                bbposWisepad3: TerminalConfigurationBbposWisepad3? = nil,
                bbposWiseposE: TerminalConfigurationBbposWiseposE? = nil,
                stripeS700: TerminalConfigurationStripeS700? = nil,
                stripeS710: TerminalConfigurationStripeS710? = nil,
                verifoneM425: TerminalConfigurationVerifoneM425? = nil,
                verifoneP400: TerminalConfigurationVerifoneP400? = nil,
                verifoneP630: TerminalConfigurationVerifoneP630? = nil,
                verifoneUx700: TerminalConfigurationVerifoneUx700? = nil,
                verifoneV660p: TerminalConfigurationVerifoneV660p? = nil,
                cellular: TerminalConfigurationCellular? = nil,
                isAccountDefault: Bool? = nil,
                name: String? = nil,
                offline: TerminalConfigurationOffline? = nil,
                readerSecurity: TerminalConfigurationReaderSecurity? = nil,
                rebootWindow: TerminalConfigurationRebootWindow? = nil,
                tipping: TerminalConfigurationTipping? = nil,
                wifi: TerminalConfigurationWifi? = nil,
                object: String,
                livemode: Bool) {
        self.id = id
        self.bbposWisepad3 = bbposWisepad3
        self.bbposWiseposE = bbposWiseposE
        self.stripeS700 = stripeS700
        self.stripeS710 = stripeS710
        self.verifoneM425 = verifoneM425
        self.verifoneP400 = verifoneP400
        self.verifoneP630 = verifoneP630
        self.verifoneUx700 = verifoneUx700
        self.verifoneV660p = verifoneV660p
        self.cellular = cellular
        self.isAccountDefault = isAccountDefault
        self.name = name
        self.offline = offline
        self.readerSecurity = readerSecurity
        self.rebootWindow = rebootWindow
        self.tipping = tipping
        self.wifi = wifi
        self.object = object
        self.livemode = livemode
    }
}

public struct TerminalConfigurationBbposWisepad3: Codable {
    /// A File ID representing an image you would like displayed on the reader.
    @Expandable<File> public var splashScreen: String?

    public init(splashScreen: String? = nil) {
        self._splashScreen = Expandable(id: splashScreen)
    }

    private enum CodingKeys: String, CodingKey {
        case splashScreen = "splashscreen"
    }
}

public struct TerminalConfigurationBbposWiseposE: Codable {
    /// A File ID representing an image you would like displayed on the reader.
    @Expandable<File> public var splashScreen: String?

    public init(splashScreen: String? = nil) {
        self._splashScreen = Expandable(id: splashScreen)
    }

    private enum CodingKeys: String, CodingKey {
        case splashScreen = "splashscreen"
    }
}

public struct TerminalConfigurationStripeS700: Codable {
    /// A File ID representing an image you would like displayed on the reader.
    @Expandable<File> public var splashScreen: String?

    public init(splashScreen: String? = nil) {
        self._splashScreen = Expandable(id: splashScreen)
    }

    private enum CodingKeys: String, CodingKey {
        case splashScreen = "splashscreen"
    }
}

public struct TerminalConfigurationStripeS710: Codable {
    /// A File ID representing an image you would like displayed on the reader.
    @Expandable<File> public var splashScreen: String?

    public init(splashScreen: String? = nil) {
        self._splashScreen = Expandable(id: splashScreen)
    }

    private enum CodingKeys: String, CodingKey {
        case splashScreen = "splashscreen"
    }
}

public struct TerminalConfigurationVerifoneM425: Codable {
    /// A File ID representing an image you would like displayed on the reader.
    @Expandable<File> public var splashScreen: String?

    public init(splashScreen: String? = nil) {
        self._splashScreen = Expandable(id: splashScreen)
    }

    private enum CodingKeys: String, CodingKey {
        case splashScreen = "splashscreen"
    }
}

public struct TerminalConfigurationVerifoneP400: Codable {
    /// A File ID representing an image you would like displayed on the reader.
    @Expandable<File> public var splashScreen: String?

    public init(splashScreen: String? = nil) {
        self._splashScreen = Expandable(id: splashScreen)
    }

    private enum CodingKeys: String, CodingKey {
        case splashScreen = "splashscreen"
    }
}

public struct TerminalConfigurationVerifoneP630: Codable {
    /// A File ID representing an image you would like displayed on the reader.
    @Expandable<File> public var splashScreen: String?

    public init(splashScreen: String? = nil) {
        self._splashScreen = Expandable(id: splashScreen)
    }

    private enum CodingKeys: String, CodingKey {
        case splashScreen = "splashscreen"
    }
}

public struct TerminalConfigurationVerifoneUx700: Codable {
    /// A File ID representing an image you would like displayed on the reader.
    @Expandable<File> public var splashScreen: String?

    public init(splashScreen: String? = nil) {
        self._splashScreen = Expandable(id: splashScreen)
    }

    private enum CodingKeys: String, CodingKey {
        case splashScreen = "splashscreen"
    }
}

public struct TerminalConfigurationVerifoneV660p: Codable {
    /// A File ID representing an image you would like displayed on the reader.
    @Expandable<File> public var splashScreen: String?

    public init(splashScreen: String? = nil) {
        self._splashScreen = Expandable(id: splashScreen)
    }

    private enum CodingKeys: String, CodingKey {
        case splashScreen = "splashscreen"
    }
}

public struct TerminalConfigurationCellular: Codable {
    /// Whether cellular connectivity should be enabled on readers that support it.
    public var enabled: Bool?

    public init(enabled: Bool? = nil) {
        self.enabled = enabled
    }
}

public struct TerminalConfigurationOffline: Codable {
    /// Determines whether to allow transactions to be collected while reader is offline. Defaults to false.
    public var enabled: Bool?

    public init(enabled: Bool? = nil) {
        self.enabled = enabled
    }
}

public struct TerminalConfigurationReaderSecurity: Codable {
    /// A code used to access the admin menu on the reader.
    public var adminMenuPasscode: String?

    public init(adminMenuPasscode: String? = nil) {
        self.adminMenuPasscode = adminMenuPasscode
    }
}

public struct TerminalConfigurationRebootWindow: Codable {
    /// Integer between 0 to 23 that represents the end hour of the reboot time window. The value must be different than the start_hour.
    public var endHour: Int?
    /// Integer between 0 to 23 that represents the start hour of the reboot time window.
    public var startHour: Int?

    public init(endHour: Int? = nil,
                startHour: Int? = nil) {
        self.endHour = endHour
        self.startHour = startHour
    }
}

public struct TerminalConfigurationTipping: Codable {
    /// Tipping configuration for AED
    public var aed: TerminalConfigurationTippingDetails?
    /// Tipping configuration for AUD
    public var aud: TerminalConfigurationTippingDetails?
    /// Tipping configuration for CAD
    public var cad: TerminalConfigurationTippingDetails?
    /// Tipping configuration for CHF
    public var chf: TerminalConfigurationTippingDetails?
    /// Tipping configuration for CZK
    public var czk: TerminalConfigurationTippingDetails?
    /// Tipping configuration for DKK
    public var dkk: TerminalConfigurationTippingDetails?
    /// Tipping configuration for EUR
    public var eur: TerminalConfigurationTippingDetails?
    /// Tipping configuration for GBP
    public var gbp: TerminalConfigurationTippingDetails?
    /// Tipping configuration for GIP
    public var gip: TerminalConfigurationTippingDetails?
    /// Tipping configuration for HKD
    public var hkd: TerminalConfigurationTippingDetails?
    /// Tipping configuration for HUF
    public var huf: TerminalConfigurationTippingDetails?
    /// Tipping configuration for JPY
    public var jpy: TerminalConfigurationTippingDetails?
    /// Tipping configuration for MXN
    public var mxn: TerminalConfigurationTippingDetails?
    /// Tipping configuration for MYR
    public var myr: TerminalConfigurationTippingDetails?
    /// Tipping configuration for NOK
    public var nok: TerminalConfigurationTippingDetails?
    /// Tipping configuration for NZD
    public var nzd: TerminalConfigurationTippingDetails?
    /// Tipping configuration for PLN
    public var pln: TerminalConfigurationTippingDetails?
    /// Tipping configuration for RON
    public var ron: TerminalConfigurationTippingDetails?
    /// Tipping configuration for SEK
    public var sek: TerminalConfigurationTippingDetails?
    /// Tipping configuration for SGD
    public var sgd: TerminalConfigurationTippingDetails?
    /// Tipping configuration for USD
    public var usd: TerminalConfigurationTippingDetails?

    public init(aed: TerminalConfigurationTippingDetails? = nil,
                aud: TerminalConfigurationTippingDetails? = nil,
                cad: TerminalConfigurationTippingDetails? = nil,
                chf: TerminalConfigurationTippingDetails? = nil,
                czk: TerminalConfigurationTippingDetails? = nil,
                dkk: TerminalConfigurationTippingDetails? = nil,
                eur: TerminalConfigurationTippingDetails? = nil,
                gbp: TerminalConfigurationTippingDetails? = nil,
                gip: TerminalConfigurationTippingDetails? = nil,
                hkd: TerminalConfigurationTippingDetails? = nil,
                huf: TerminalConfigurationTippingDetails? = nil,
                jpy: TerminalConfigurationTippingDetails? = nil,
                mxn: TerminalConfigurationTippingDetails? = nil,
                myr: TerminalConfigurationTippingDetails? = nil,
                nok: TerminalConfigurationTippingDetails? = nil,
                nzd: TerminalConfigurationTippingDetails? = nil,
                pln: TerminalConfigurationTippingDetails? = nil,
                ron: TerminalConfigurationTippingDetails? = nil,
                sek: TerminalConfigurationTippingDetails? = nil,
                sgd: TerminalConfigurationTippingDetails? = nil,
                usd: TerminalConfigurationTippingDetails? = nil) {
        self.aed = aed
        self.aud = aud
        self.cad = cad
        self.chf = chf
        self.czk = czk
        self.dkk = dkk
        self.eur = eur
        self.gbp = gbp
        self.gip = gip
        self.hkd = hkd
        self.huf = huf
        self.jpy = jpy
        self.mxn = mxn
        self.myr = myr
        self.nok = nok
        self.nzd = nzd
        self.pln = pln
        self.ron = ron
        self.sek = sek
        self.sgd = sgd
        self.usd = usd
    }
}

public struct TerminalConfigurationTippingDetails: Codable {
    /// Fixed amounts displayed when collecting a tip
    public var fixedAmounts: [Int]?
    /// Percentages displayed when collecting a tip
    public var percentages: [Int]?
    /// Below this amount, fixed amounts will be displayed; above it, percentages will be displayed
    public var smartTipThreshold: Int?

    public init(fixedAmounts: [Int]? = nil,
                percentages: [Int]? = nil,
                smartTipThreshold: Int? = nil) {
        self.fixedAmounts = fixedAmounts
        self.percentages = percentages
        self.smartTipThreshold = smartTipThreshold
    }
}

public struct TerminalConfigurationWifi: Codable {
    /// Credentials for a WPA-Enterprise WiFi network using the EAP-PEAP authentication method.
    public var enterpriseEapPeap: TerminalConfigurationWifiEnterpriseEapPeap?
    /// Credentials for a WPA-Enterprise WiFi network using the EAP-TLS authentication method.
    public var enterpriseEapTls: TerminalConfigurationWifiEnterpriseEapTls?
    /// Credentials for a WPA-Personal WiFi network.
    public var personalPsk: TerminalConfigurationWifiPersonalPsk?
    /// Security type of the WiFi network. The hash with the corresponding name contains the credentials for this security type.
    public var type: TerminalConfigurationWifiType?

    public init(enterpriseEapPeap: TerminalConfigurationWifiEnterpriseEapPeap? = nil,
                enterpriseEapTls: TerminalConfigurationWifiEnterpriseEapTls? = nil,
                personalPsk: TerminalConfigurationWifiPersonalPsk? = nil,
                type: TerminalConfigurationWifiType? = nil) {
        self.enterpriseEapPeap = enterpriseEapPeap
        self.enterpriseEapTls = enterpriseEapTls
        self.personalPsk = personalPsk
        self.type = type
    }
}

public enum TerminalConfigurationWifiType: String, Codable {
    case personalPsk = "personal_psk"
    case enterpriseEapPeap = "enterprise_eap_peap"
    case enterpriseEapTls = "enterprise_eap_tls"
}

public struct TerminalConfigurationWifiEnterpriseEapPeap: Codable {
    /// A File ID representing a PEM file containing the server certificate.
    public var caCertificateFile: String?
    /// Password for connecting to the WiFi network.
    public var password: String?
    /// Name of the WiFi network.
    public var ssid: String?
    /// Username for connecting to the WiFi network.
    public var username: String?

    public init(caCertificateFile: String? = nil,
                password: String? = nil,
                ssid: String? = nil,
                username: String? = nil) {
        self.caCertificateFile = caCertificateFile
        self.password = password
        self.ssid = ssid
        self.username = username
    }
}

public struct TerminalConfigurationWifiEnterpriseEapTls: Codable {
    /// A File ID representing a PEM file containing the server certificate.
    public var caCertificateFile: String?
    /// A File ID representing a PEM file containing the client certificate.
    public var clientCertificateFile: String?
    /// A File ID representing a PEM file containing the client RSA private key.
    public var privateKeyFile: String?
    /// Password for the private key file.
    public var privateKeyFilePassword: String?
    /// Name of the WiFi network.
    public var ssid: String?

    public init(caCertificateFile: String? = nil,
                clientCertificateFile: String? = nil,
                privateKeyFile: String? = nil,
                privateKeyFilePassword: String? = nil,
                ssid: String? = nil) {
        self.caCertificateFile = caCertificateFile
        self.clientCertificateFile = clientCertificateFile
        self.privateKeyFile = privateKeyFile
        self.privateKeyFilePassword = privateKeyFilePassword
        self.ssid = ssid
    }
}

public struct TerminalConfigurationWifiPersonalPsk: Codable {
    /// Password for connecting to the WiFi network.
    public var password: String?
    /// Name of the WiFi network.
    public var ssid: String?

    public init(password: String? = nil,
                ssid: String? = nil) {
        self.password = password
        self.ssid = ssid
    }
}

public struct TerminalConfigurationList: Codable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [TerminalConfiguration]?

    public init(object: String,
                hasMore: Bool? = nil,
                url: String? = nil,
                data: [TerminalConfiguration]? = nil) {
        self.object = object
        self.hasMore = hasMore
        self.url = url
        self.data = data
    }
}

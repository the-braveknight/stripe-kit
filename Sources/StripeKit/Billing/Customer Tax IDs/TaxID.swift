//
//  TaxID.swift
//  Stripe
//
//  Created by Andrew Edwards on 5/11/19.
//

import Foundation

/// The [Tax ID Object](https://stripe.com/docs/api/customer_tax_ids/object) .
public struct TaxID: Codable {
    /// Unique identifier for the object.
    public var id: String
    /// Two-letter ISO code representing the country of the tax ID.
    public var country: String?
    /// ID of the customer.
    @Expandable<Customer> public var customer: String?
    /// The ID of the Account object that represents the customer that this tax ID belongs to.
    public var customerAccount: String?
    /// The account or customer the tax ID belongs to.
    public var owner: TaxIDOwner?
    /// Type of the tax ID.
    public var type: TaxIDType?
    /// Value of the tax ID.
    public var value: String?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    /// Tax ID verification information.
    public var verification: TaxIDVerififcation?

    public init(id: String,
                country: String? = nil,
                customer: String? = nil,
                customerAccount: String? = nil,
                owner: TaxIDOwner? = nil,
                type: TaxIDType? = nil,
                value: String? = nil,
                object: String,
                created: Date,
                livemode: Bool? = nil,
                verification: TaxIDVerififcation? = nil) {
        self.id = id
        self.country = country
        self._customer = Expandable(id: customer)
        self.customerAccount = customerAccount
        self.owner = owner
        self.type = type
        self.value = value
        self.object = object
        self.created = created
        self.livemode = livemode
        self.verification = verification
    }
}

public struct TaxIDOwner: Codable {
    /// Type of owner referenced.
    public var type: TaxIDOwnerType?
    /// The account being referenced when `type` is `account`.
    @Expandable<ConnectAccount> public var account: String?
    /// The Connect Application being referenced when `type` is `application`.
    public var application: String?
    /// The customer being referenced when `type` is `customer`.
    @Expandable<Customer> public var customer: String?
    /// The ID of the Account object that represents the customer being referenced when `type` is `customer` and the customer is an Account.
    public var customerAccount: String?

    public init(type: TaxIDOwnerType? = nil,
                account: String? = nil,
                application: String? = nil,
                customer: String? = nil,
                customerAccount: String? = nil) {
        self.type = type
        self._account = Expandable(id: account)
        self.application = application
        self._customer = Expandable(id: customer)
        self.customerAccount = customerAccount
    }
}

public enum TaxIDOwnerType: String, Codable {
    case account
    case application
    case customer
    case `self`
}

public enum TaxIDType: String, Codable {
    case adNrt = "ad_nrt"
    case aeTrn = "ae_trn"
    case alTin = "al_tin"
    case amTin = "am_tin"
    case aoTin = "ao_tin"
    case arCuit = "ar_cuit"
    case auAbn = "au_abn"
    case auArn = "au_arn"
    case awTin = "aw_tin"
    case azTin = "az_tin"
    case baTin = "ba_tin"
    case bbTin = "bb_tin"
    case bdBin = "bd_bin"
    case bfIfu = "bf_ifu"
    case bgUic = "bg_uic"
    case bhVat = "bh_vat"
    case bjIfu = "bj_ifu"
    case boTin = "bo_tin"
    case brCnpj = "br_cnpj"
    case brCpf = "br_cpf"
    case bsTin = "bs_tin"
    case byTin = "by_tin"
    case caBn = "ca_bn"
    case caGstHst = "ca_gst_hst"
    case caPstBc = "ca_pst_bc"
    case caPstMb = "ca_pst_mb"
    case caPstSk = "ca_pst_sk"
    case caQst = "ca_qst"
    case cdNif = "cd_nif"
    case chUid = "ch_uid"
    case chVat = "ch_vat"
    case clTin = "cl_tin"
    case cmNiu = "cm_niu"
    case cnTin = "cn_tin"
    case coNit = "co_nit"
    case crTin = "cr_tin"
    case cvNif = "cv_nif"
    case deStn = "de_stn"
    case doRcn = "do_rcn"
    case ecRuc = "ec_ruc"
    case egTin = "eg_tin"
    case esCif = "es_cif"
    case etTin = "et_tin"
    case euOssVat = "eu_oss_vat"
    case euVat = "eu_vat"
    case foVat = "fo_vat"
    case gbVat = "gb_vat"
    case geVat = "ge_vat"
    case giTin = "gi_tin"
    case gnNif = "gn_nif"
    case hkBr = "hk_br"
    case hrOib = "hr_oib"
    case huTin = "hu_tin"
    case idNpwp = "id_npwp"
    case ilVat = "il_vat"
    case inGst = "in_gst"
    case isVat = "is_vat"
    case itCf = "it_cf"
    case jpCn = "jp_cn"
    case jpRn = "jp_rn"
    case jpTrn = "jp_trn"
    case kePin = "ke_pin"
    case kgTin = "kg_tin"
    case khTin = "kh_tin"
    case krBrn = "kr_brn"
    case kzBin = "kz_bin"
    case laTin = "la_tin"
    case liUid = "li_uid"
    case liVat = "li_vat"
    case lkVat = "lk_vat"
    case maVat = "ma_vat"
    case mdVat = "md_vat"
    case mePib = "me_pib"
    case mkVat = "mk_vat"
    case mrNif = "mr_nif"
    case mxRfc = "mx_rfc"
    case myFrp = "my_frp"
    case myItn = "my_itn"
    case mySst = "my_sst"
    case ngTin = "ng_tin"
    case noVat = "no_vat"
    case noVoec = "no_voec"
    case npPan = "np_pan"
    case nzGst = "nz_gst"
    case omVat = "om_vat"
    case peRuc = "pe_ruc"
    case phTin = "ph_tin"
    case plNip = "pl_nip"
    case pyRuc = "py_ruc"
    case roTin = "ro_tin"
    case rsPib = "rs_pib"
    case ruInn = "ru_inn"
    case ruKpp = "ru_kpp"
    case saVat = "sa_vat"
    case sgGst = "sg_gst"
    case sgUen = "sg_uen"
    case siTin = "si_tin"
    case snNinea = "sn_ninea"
    case srFin = "sr_fin"
    case svNit = "sv_nit"
    case thVat = "th_vat"
    case tjTin = "tj_tin"
    case trTin = "tr_tin"
    case twVat = "tw_vat"
    case tzVat = "tz_vat"
    case uaVat = "ua_vat"
    case ugTin = "ug_tin"
    case usEin = "us_ein"
    case uyRuc = "uy_ruc"
    case uzTin = "uz_tin"
    case uzVat = "uz_vat"
    case veRif = "ve_rif"
    case vnTin = "vn_tin"
    case zaVat = "za_vat"
    case zmTin = "zm_tin"
    case zwTin = "zw_tin"
    case unknown
}

public struct TaxIDVerififcation: Codable {
    /// Verification status, one of `pending`, `unavailable`, `unverified`, or `verified`.
    public var status: TaxIDVerififcationStatus?
    /// Verified address.
    public var verifiedAddress: String?
    /// Verified name.
    public var verifiedName: String?
    
    public init(status: TaxIDVerififcationStatus? = nil,
                verifiedAddress: String? = nil,
                verifiedName: String? = nil) {
        self.status = status
        self.verifiedAddress = verifiedAddress
        self.verifiedName = verifiedName
    }
}

public enum TaxIDVerififcationStatus: String, Codable {
    case pending
    case unavailable
    case unverified
    case verified
}

public struct TaxIDList: Codable {
    public var object: String
    public var url: String?
    public var hasMore: Bool?
    public var data: [TaxID]?
    
    public init(object: String,
                url: String? = nil,
                hasMore: Bool? = nil,
                data: [TaxID]? = nil) {
        self.object = object
        self.url = url
        self.hasMore = hasMore
        self.data = data
    }
}

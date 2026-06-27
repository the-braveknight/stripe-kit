//
//  VerificationSession.swift
//  StripeKit
//
//  Created by Andrew Edwards on 7/24/21.
//

import Foundation

public struct VerificationSession: Codable {
    /// Unique identifier for the object.
    public var id: String
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// A string to reference this user. This can be a customer ID, a session ID, or similar, and can be used to reconcile this verification with your internal systems.
    public var clientReferenceId: String?
    /// The short-lived client secret used by Stripe.js to show a verification modal inside your app. This client secret expires after 24 hours and can only be used once. Don’t store it, log it, embed it in a URL, or expose it to anyone other than the user. Make sure that you have TLS enabled on any page that includes the client secret. Refer to our docs on passing the client secret to the frontend to learn more.
    public var clientSecret: String?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// If present, this property tells you the last error encountered when processing the verification.
    public var lastError: VerificationSessionLastError?
    /// ID of the most recent VerificationReport. [Learn more about accessing detailed verification results](https://stripe.com/docs/identity/verification-sessions#results)
    @Expandable<VerificationReport> public var lastVerificationReport: String?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// A set of options for the session’s verification checks.
    public var options: VerificationSessionOptions?
    /// Details provided about the user being verified. These details may be shown to the user.
    public var providedDetails: VerificationSessionProvidedDetails?
    /// Redaction status of this VerificationSession. If the VerificationSession is not redacted, this field will be null.
    public var redaction: VerificationSessionRedaction?
    /// Customer ID of the user being verified.
    public var relatedCustomer: String?
    /// The Account representing the customer associated with the VerificationSession.
    public var relatedCustomerAccount: String?
    /// Tokens referencing a Person resource and its associated account.
    public var relatedPerson: VerificationSessionRelatedPerson?
    /// Status of this VerificationSession. [Learn more about the lifecycle of sessions](https://stripe.com/docs/identity/how-sessions-work)
    public var status: VerificationSessionStatus?
    /// The type of [verification check](https://stripe.com/docs/identity/verification-checks) to be performed.
    public var type: VerificationSessionType?
    /// The short-lived URL that you use to redirect a user to Stripe to submit their identity information. This URL expires after 24 hours and can only be used once. Don’t store it, log it, send it in emails or expose it to anyone other than the user. Refer to our docs on [verifying identity documents](https://stripe.com/docs/identity/verify-identity-documents?platform=web&type=redirect) to learn how to redirect users to Stripe.
    public var url: String?
    /// The configuration token of a verification flow from the dashboard.
    public var verificationFlow: String?
    /// The user’s verified data.
    /// This field is not included by default. To include it in the response, expand the `verified_outputs` field.
    public var verifiedOutputs: VerificationSessionVerifiedOutputs?

    public init(id: String,
                object: String,
                clientReferenceId: String? = nil,
                clientSecret: String? = nil,
                created: Date,
                lastError: VerificationSessionLastError? = nil,
                lastVerificationReport: String? = nil,
                livemode: Bool? = nil,
                metadata: [String : String]? = nil,
                options: VerificationSessionOptions? = nil,
                providedDetails: VerificationSessionProvidedDetails? = nil,
                redaction: VerificationSessionRedaction? = nil,
                relatedCustomer: String? = nil,
                relatedCustomerAccount: String? = nil,
                relatedPerson: VerificationSessionRelatedPerson? = nil,
                status: VerificationSessionStatus? = nil,
                type: VerificationSessionType? = nil,
                url: String? = nil,
                verificationFlow: String? = nil,
                verifiedOutputs: VerificationSessionVerifiedOutputs? = nil) {
        self.id = id
        self.object = object
        self.clientReferenceId = clientReferenceId
        self.clientSecret = clientSecret
        self.created = created
        self.lastError = lastError
        self._lastVerificationReport = Expandable(id: lastVerificationReport)
        self.livemode = livemode
        self.metadata = metadata
        self.options = options
        self.providedDetails = providedDetails
        self.redaction = redaction
        self.relatedCustomer = relatedCustomer
        self.relatedCustomerAccount = relatedCustomerAccount
        self.relatedPerson = relatedPerson
        self.status = status
        self.type = type
        self.url = url
        self.verificationFlow = verificationFlow
        self.verifiedOutputs = verifiedOutputs
    }
}

public struct VerificationSessionLastError: Codable {
    /// A short machine-readable string giving the reason for the verification or user-session failure.
    public var code: VerificationSessionLastErrorCode?
    /// A message that explains the reason for verification or user-session failure.
    public var reason: String?
    
    public init(code: VerificationSessionLastErrorCode? = nil,
                reason: String? = nil) {
        self.code = code
        self.reason = reason
    }
}

public enum VerificationSessionLastErrorCode: String, Codable {
    /// The user declined to be verified by Stripe. Check with your legal counsel to see if you have an obligation to offer an alternative, non-biometric means to verify, such as through a manual review.
    case consentDeclined = "consent_declined"
    /// The user’s device didn’t have a camera or they declined to grant Stripe permission to access it.
    case deviceNotSupported = "device_not_supported"
    /// The user began the verification but didn’t submit it.
    case abandoned
    /// Stripe does not verify users under the age of 16.
    case underSupportedAge = "under_supported_age"
    /// Stripe does not verify users from the provided country.
    case countryNotSupported = "country_not_supported"
    /// The provided identity document has expired.
    case documentExpired = "document_expired"
    /// Stripe couldn’t verify the provided identity document. See list of supported document types.
    case documentUnverifiedOther = "document_unverified_other"
    /// The provided identity document isn’t one of the session’s allowed document types.
    case documentTypeNotSupported = "document_type_not_supported"
    /// The provided identity document didn’t contain a picture of a face.
    case selfieDocumentMissingPhoto = "selfie_document_missing_photo"
    /// The captured face image didn’t match with the document’s face.
    case selfieFaceMismatch = "selfie_face_mismatch"
    /// Stripe couldn’t verify the provided selfie.
    case selfieUnverifiedOther = "selfie_unverified_other"
    /// The captured face image was manipulated.
    case selfieManipulated = "selfie_manipulated"
    /// The information provided couldn’t be verified. See list of supported ID numbers.
    case idNumberUnverifiedOther = "id_number_unverified_other"
    /// The provided document didn’t contain enough data to match against the ID number.
    case idNumberInsufficientDocumentData = "id_number_insufficient_document_data"
    /// The information provided couldn’t be matched against global databases.
    case idNumberMismatch = "id_number_mismatch"
    /// The provided email could not be verified for any other reason.
    case emailUnverifiedOther = "email_unverified_other"
    /// The user declined to verify their email.
    case emailVerificationDeclined = "email_verification_declined"
    /// The provided phone number could not be verified for any other reason.
    case phoneUnverifiedOther = "phone_unverified_other"
    /// The user declined to verify their phone number.
    case phoneVerificationDeclined = "phone_verification_declined"
}

public struct VerificationSessionOptions: Codable {
    /// Configuration options to apply to the `document` check.
    public var document: VerificationSessionOptionsDocument?
    /// Configuration options to apply to the `email` check.
    public var email: VerificationSessionOptionsEmail?
    /// Configuration options to apply to the `id_number` check.
    public var idNumber: VerificationSessionOptionsIdNumber?
    /// Configuration options to apply to the matching of verified data with provided data.
    public var matching: VerificationSessionOptionsMatching?
    /// Configuration options to apply to the `phone` check.
    public var phone: VerificationSessionOptionsPhone?

    public init(document: VerificationSessionOptionsDocument? = nil,
                email: VerificationSessionOptionsEmail? = nil,
                idNumber: VerificationSessionOptionsIdNumber? = nil,
                matching: VerificationSessionOptionsMatching? = nil,
                phone: VerificationSessionOptionsPhone? = nil) {
        self.document = document
        self.email = email
        self.idNumber = idNumber
        self.matching = matching
        self.phone = phone
    }
}

public struct VerificationSessionOptionsEmail: Codable {
    /// Request one time password verification of `provided_details.email`.
    public var requireVerification: Bool?

    public init(requireVerification: Bool? = nil) {
        self.requireVerification = requireVerification
    }
}

public struct VerificationSessionOptionsMatching: Codable {
    /// Strictness of the DOB matching policy to apply.
    public var dob: VerificationSessionOptionsMatchingPolicy?
    /// Strictness of the name matching policy to apply.
    public var name: VerificationSessionOptionsMatchingPolicy?

    public init(dob: VerificationSessionOptionsMatchingPolicy? = nil,
                name: VerificationSessionOptionsMatchingPolicy? = nil) {
        self.dob = dob
        self.name = name
    }
}

public enum VerificationSessionOptionsMatchingPolicy: String, Codable {
    /// Do not require the data to match.
    case none
    /// Require the data to be similar.
    case similar
}

public struct VerificationSessionOptionsPhone: Codable {
    /// Request one time password verification of `provided_details.phone`.
    public var requireVerification: Bool?

    public init(requireVerification: Bool? = nil) {
        self.requireVerification = requireVerification
    }
}

public struct VerificationSessionOptionsDocument: Codable {
    /// Array of strings of allowed identity document types. If the provided identity document isn’t one of the allowed types, the verification check will fail with a `document_type_not_allowed` error code.
    public var allowedTypes: [VerificationSessionOptionsDocumentAllowedType]?
    /// Collect an ID number and perform an [ID number check](https://stripe.com/docs/identity/verification-checks?type=id-number) with the document’s extracted name and date of birth.
    public var requireIdNumber: Bool?
    /// Disable image uploads, identity document images have to be captured using the device’s camera.
    public var requireLiveCapture: Bool?
    /// Capture a face image and perform a [selfie check](https://stripe.com/docs/identity/verification-checks?type=selfie) comparing a photo ID and a picture of your user’s face. Learn more.
    public var requireMatchingSelfie: Bool
    
    public init(allowedTypes: [VerificationSessionOptionsDocumentAllowedType]? = nil,
                requireIdNumber: Bool? = nil,
                requireLiveCapture: Bool? = nil,
                requireMatchingSelfie: Bool) {
        self.allowedTypes = allowedTypes
        self.requireIdNumber = requireIdNumber
        self.requireLiveCapture = requireLiveCapture
        self.requireMatchingSelfie = requireMatchingSelfie
    }
}

public enum VerificationSessionOptionsDocumentAllowedType: String, Codable {
    /// Drivers license document type.
    case drivingLicense = "driving_license"
    /// Passport document type.
    case passport
    /// ID card document type.
    case idCard = "id_card"
}

public struct VerificationSessionOptionsIdNumber: Codable {
    public init(){}
}

public struct VerificationSessionProvidedDetails: Codable {
    /// Email of user being verified.
    public var email: String?
    /// Phone number of user being verified.
    public var phone: String?

    public init(email: String? = nil, phone: String? = nil) {
        self.email = email
        self.phone = phone
    }
}

public struct VerificationSessionRelatedPerson: Codable {
    /// Token referencing the associated Account of the related Person resource.
    public var account: String?
    /// Token referencing the related Person resource.
    public var person: String?

    public init(account: String? = nil, person: String? = nil) {
        self.account = account
        self.person = person
    }
}

public struct VerificationSessionRedaction: Codable {
    /// Indicates whether this object and its related objects have been redacted or not.
    public var status: VerificationSessionRedactionStatus?

    public init(status: VerificationSessionRedactionStatus? = nil) {
        self.status = status
    }
}

public enum VerificationSessionRedactionStatus: String, Codable {
    /// This object and its related objects have been redacted.
    case redacted
    /// This object has been redacted, and its related objects are in the process of being redacted. This process may take up to four days.
    case processing
    /// This object’s redaction has been validated.
    case validated
}

public enum VerificationSessionStatus: String, Codable {
    /// Requires user input before processing can continue.
    case requiresInput = "requires_input"
    /// The session has been submitted and is being processed. Most [verification checks](https://stripe.com/docs/identity/verification-checks) take a few minutes to process.
    case processing
    /// Processing of all the verification checks are complete and successfully verified.
    case verified
    /// The VerificationSession has been invalidated for future submission attempts.
    case canceled
}

public enum VerificationSessionType: String, Codable {
    /// [Document check](https://stripe.com/docs/identity/verification-checks?type=document)
    case document
    /// [ID number check](https://stripe.com/docs/identity/verification-checks?type=id-number).
    case idNumber = "id_number"
    /// Configuration provided by a verification flow.
    case verificationFlow = "verification_flow"
}

public struct VerificationSessionVerifiedOutputs: Codable {
    /// The user’s verified address.
    public var address: Address?
    /// The user’s verified date of birth.
    /// This field is not included by default. To include it in the response, expand the `dob` field.
    public var dob: PersonDOB?
    /// The user’s verified email address.
    public var email: String?
    /// The user’s verified first name.
    public var firstName: String?
    /// The user’s verified id number.
    /// This field is not included by default. To include it in the response, expand the `id_number` field.
    public var idNumber: String?
    /// The user’s verified id number type.
    public var idNumberType: VerificationSessionVerifiedOutputsIdNumberType?
    /// The user’s verified last name.
    public var lastName: String?
    /// The user’s verified phone number.
    public var phone: String?
    /// The user’s verified sex.
    /// This field is not included by default. To include it in the response, expand the `sex` field.
    public var sex: VerificationSessionVerifiedOutputsSex?
    /// The user’s verified place of birth as it appears in the document.
    /// This field is not included by default. To include it in the response, expand the `unparsed_place_of_birth` field.
    public var unparsedPlaceOfBirth: String?
    /// The user’s verified sex as it appears in the document.
    /// This field is not included by default. To include it in the response, expand the `unparsed_sex` field.
    public var unparsedSex: String?

    public init(address: Address? = nil,
                dob: PersonDOB? = nil,
                email: String? = nil,
                firstName: String? = nil,
                idNumber: String? = nil,
                idNumberType: VerificationSessionVerifiedOutputsIdNumberType? = nil,
                lastName: String? = nil,
                phone: String? = nil,
                sex: VerificationSessionVerifiedOutputsSex? = nil,
                unparsedPlaceOfBirth: String? = nil,
                unparsedSex: String? = nil) {
        self.address = address
        self.dob = dob
        self.email = email
        self.firstName = firstName
        self.idNumber = idNumber
        self.idNumberType = idNumberType
        self.lastName = lastName
        self.phone = phone
        self.sex = sex
        self.unparsedPlaceOfBirth = unparsedPlaceOfBirth
        self.unparsedSex = unparsedSex
    }
}

public enum VerificationSessionVerifiedOutputsIdNumberType: String, Codable {
    /// An individual CPF number from Brazil.
    case brCpf = "br_cpf"
    /// A national registration identity card number from Singapore.
    case sgNric = "sg_nric"
    /// A social security number from the United States.
    case usSsn = "us_ssn"
}

public enum VerificationSessionVerifiedOutputsSex: String, Codable {
    case redacted = "[redacted]"
    case female
    case male
    case unknown
}


public struct VerificationSessionList: Codable {
    public var object: String
    public var data: [VerificationSession]?
    public var hasMore: Bool?
    public var url: String?
    
    public init(object: String,
                data: [VerificationSession]? = nil,
                hasMore: Bool? = nil,
                url: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.url = url
    }
}

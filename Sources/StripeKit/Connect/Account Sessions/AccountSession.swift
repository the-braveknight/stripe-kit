//
//  AccountSession.swift
//  
//
//  Created by Andrew Edwards on 5/14/23.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public struct AccountSession: Codable {
    /// The ID of the account the AccountSession was created for
    public var account: String
    /// The client secret of this AccountSession. Used on the client to set up secure access to the given account.
    /// The client secret can be used to provide access to account from your frontend. It should not be stored, logged, or exposed to anyone other than the connected account. Make sure that you have TLS enabled on any page that includes the client secret.
    /// Refer to our docs to setup Connect embedded components and learn about how `client_secret` should be handled.
    public var clientSecret: String?
    /// The list of components that the platform has configured for the account session, along with whether they are enabled and their respective features.
    public var components: AccountSessionComponents?
    /// The timestamp at which this AccountSession will expire.
    public var expiresAt: Date?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool

    public init(account: String,
                clientSecret: String? = nil,
                components: AccountSessionComponents? = nil,
                expiresAt: Date? = nil,
                object: String, livemode: Bool) {
        self.account = account
        self.clientSecret = clientSecret
        self.components = components
        self.expiresAt = expiresAt
        self.object = object
        self.livemode = livemode
    }
}

/// A generic embedded component configuration, describing whether the component is enabled and which features are turned on.
public struct AccountSessionComponent<Features: Codable>: Codable {
    /// Whether the embedded component is enabled.
    public var enabled: Bool?
    /// The features enabled in the embedded component.
    public var features: Features?

    public init(enabled: Bool? = nil, features: Features? = nil) {
        self.enabled = enabled
        self.features = features
    }
}

/// The set of embedded components configured for an ``AccountSession``.
public struct AccountSessionComponents: Codable {
    /// Configuration for the account management embedded component.
    public var accountManagement: AccountSessionComponent<AccountSessionAccountManagementFeatures>?
    /// Configuration for the account onboarding embedded component.
    public var accountOnboarding: AccountSessionComponent<AccountSessionAccountOnboardingFeatures>?
    /// Configuration for the balance report embedded component.
    public var balanceReport: AccountSessionComponent<AccountSessionEmptyFeatures>?
    /// Configuration for the balances embedded component.
    public var balances: AccountSessionComponent<AccountSessionPayoutsFeatures>?
    /// Configuration for the disputes list embedded component.
    public var disputesList: AccountSessionComponent<AccountSessionPaymentsFeatures>?
    /// Configuration for the documents embedded component.
    public var documents: AccountSessionComponent<AccountSessionEmptyFeatures>?
    /// Configuration for the financial account embedded component.
    public var financialAccount: AccountSessionComponent<AccountSessionFinancialAccountFeatures>?
    /// Configuration for the financial account transactions embedded component.
    public var financialAccountTransactions: AccountSessionComponent<AccountSessionFinancialAccountTransactionsFeatures>?
    /// Configuration for the instant payouts promotion embedded component.
    public var instantPayoutsPromotion: AccountSessionComponent<AccountSessionInstantPayoutsPromotionFeatures>?
    /// Configuration for the issuing card embedded component.
    public var issuingCard: AccountSessionComponent<AccountSessionIssuingCardFeatures>?
    /// Configuration for the issuing cards list embedded component.
    public var issuingCardsList: AccountSessionComponent<AccountSessionIssuingCardsListFeatures>?
    /// Configuration for the notification banner embedded component.
    public var notificationBanner: AccountSessionComponent<AccountSessionNotificationBannerFeatures>?
    /// Configuration for the payment details embedded component.
    public var paymentDetails: AccountSessionComponent<AccountSessionPaymentsFeatures>?
    /// Configuration for the payment disputes embedded component.
    public var paymentDisputes: AccountSessionComponent<AccountSessionPaymentDisputesFeatures>?
    /// Configuration for the payments embedded component.
    public var payments: AccountSessionComponent<AccountSessionPaymentsFeatures>?
    /// Configuration for the payout details embedded component.
    public var payoutDetails: AccountSessionComponent<AccountSessionEmptyFeatures>?
    /// Configuration for the payout reconciliation report embedded component.
    public var payoutReconciliationReport: AccountSessionComponent<AccountSessionEmptyFeatures>?
    /// Configuration for the payouts embedded component.
    public var payouts: AccountSessionComponent<AccountSessionPayoutsFeatures>?
    /// Configuration for the payouts list embedded component.
    public var payoutsList: AccountSessionComponent<AccountSessionEmptyFeatures>?
    /// Configuration for the tax registrations embedded component.
    public var taxRegistrations: AccountSessionComponent<AccountSessionEmptyFeatures>?
    /// Configuration for the tax settings embedded component.
    public var taxSettings: AccountSessionComponent<AccountSessionEmptyFeatures>?

    public init(accountManagement: AccountSessionComponent<AccountSessionAccountManagementFeatures>? = nil,
                accountOnboarding: AccountSessionComponent<AccountSessionAccountOnboardingFeatures>? = nil,
                balanceReport: AccountSessionComponent<AccountSessionEmptyFeatures>? = nil,
                balances: AccountSessionComponent<AccountSessionPayoutsFeatures>? = nil,
                disputesList: AccountSessionComponent<AccountSessionPaymentsFeatures>? = nil,
                documents: AccountSessionComponent<AccountSessionEmptyFeatures>? = nil,
                financialAccount: AccountSessionComponent<AccountSessionFinancialAccountFeatures>? = nil,
                financialAccountTransactions: AccountSessionComponent<AccountSessionFinancialAccountTransactionsFeatures>? = nil,
                instantPayoutsPromotion: AccountSessionComponent<AccountSessionInstantPayoutsPromotionFeatures>? = nil,
                issuingCard: AccountSessionComponent<AccountSessionIssuingCardFeatures>? = nil,
                issuingCardsList: AccountSessionComponent<AccountSessionIssuingCardsListFeatures>? = nil,
                notificationBanner: AccountSessionComponent<AccountSessionNotificationBannerFeatures>? = nil,
                paymentDetails: AccountSessionComponent<AccountSessionPaymentsFeatures>? = nil,
                paymentDisputes: AccountSessionComponent<AccountSessionPaymentDisputesFeatures>? = nil,
                payments: AccountSessionComponent<AccountSessionPaymentsFeatures>? = nil,
                payoutDetails: AccountSessionComponent<AccountSessionEmptyFeatures>? = nil,
                payoutReconciliationReport: AccountSessionComponent<AccountSessionEmptyFeatures>? = nil,
                payouts: AccountSessionComponent<AccountSessionPayoutsFeatures>? = nil,
                payoutsList: AccountSessionComponent<AccountSessionEmptyFeatures>? = nil,
                taxRegistrations: AccountSessionComponent<AccountSessionEmptyFeatures>? = nil,
                taxSettings: AccountSessionComponent<AccountSessionEmptyFeatures>? = nil) {
        self.accountManagement = accountManagement
        self.accountOnboarding = accountOnboarding
        self.balanceReport = balanceReport
        self.balances = balances
        self.disputesList = disputesList
        self.documents = documents
        self.financialAccount = financialAccount
        self.financialAccountTransactions = financialAccountTransactions
        self.instantPayoutsPromotion = instantPayoutsPromotion
        self.issuingCard = issuingCard
        self.issuingCardsList = issuingCardsList
        self.notificationBanner = notificationBanner
        self.paymentDetails = paymentDetails
        self.paymentDisputes = paymentDisputes
        self.payments = payments
        self.payoutDetails = payoutDetails
        self.payoutReconciliationReport = payoutReconciliationReport
        self.payouts = payouts
        self.payoutsList = payoutsList
        self.taxRegistrations = taxRegistrations
        self.taxSettings = taxSettings
    }
}

/// A feature set with no configurable features.
public struct AccountSessionEmptyFeatures: Codable {
    public init() {}
}

/// Features available for the `account_management` embedded component.
public struct AccountSessionAccountManagementFeatures: Codable {
    /// Whether to allow platforms to control bank account collection for their connected accounts.
    public var externalAccountCollection: Bool?
    /// Disables Stripe user authentication for this embedded component.
    public var disableStripeUserAuthentication: Bool?

    public init(externalAccountCollection: Bool? = nil, disableStripeUserAuthentication: Bool? = nil) {
        self.externalAccountCollection = externalAccountCollection
        self.disableStripeUserAuthentication = disableStripeUserAuthentication
    }
}

/// Features available for the `account_onboarding` embedded component.
public struct AccountSessionAccountOnboardingFeatures: Codable {
    /// Whether to allow platforms to control bank account collection for their connected accounts.
    public var externalAccountCollection: Bool?
    /// Disables Stripe user authentication for this embedded component.
    public var disableStripeUserAuthentication: Bool?

    public init(externalAccountCollection: Bool? = nil, disableStripeUserAuthentication: Bool? = nil) {
        self.externalAccountCollection = externalAccountCollection
        self.disableStripeUserAuthentication = disableStripeUserAuthentication
    }
}

/// Features available for the `balances` and `payouts` embedded components.
public struct AccountSessionPayoutsFeatures: Codable {
    /// Disables Stripe user authentication for this embedded component.
    public var disableStripeUserAuthentication: Bool?
    /// Whether to allow payout schedule to be changed.
    public var editPayoutSchedule: Bool?
    /// Whether to allow platforms to control bank account collection for their connected accounts.
    public var externalAccountCollection: Bool?
    /// Whether to allow creation of instant payouts.
    public var instantPayouts: AccountSessionInstantPayouts?
    /// Whether to allow creation of standard payouts.
    public var standardPayouts: Bool?

    public init(disableStripeUserAuthentication: Bool? = nil,
                editPayoutSchedule: Bool? = nil,
                externalAccountCollection: Bool? = nil,
                instantPayouts: AccountSessionInstantPayouts? = nil,
                standardPayouts: Bool? = nil) {
        self.disableStripeUserAuthentication = disableStripeUserAuthentication
        self.editPayoutSchedule = editPayoutSchedule
        self.externalAccountCollection = externalAccountCollection
        self.instantPayouts = instantPayouts
        self.standardPayouts = standardPayouts
    }
}

/// Possible values for the `instant_payouts` feature flag.
public enum AccountSessionInstantPayouts: String, Codable {
    /// Explicitly disable instant payouts.
    case disabled
    /// Explicitly enable instant payouts.
    case enabled
    /// Enable instant payouts according to the platform's Dashboard settings.
    case useDashboardRules = "use_dashboard_rules"
}

/// Features available for the `payments`, `payment_details`, and `disputes_list` embedded components.
public struct AccountSessionPaymentsFeatures: Codable {
    /// Whether to allow capturing and cancelling payment intents.
    public var capturePayments: Bool?
    /// Whether connected accounts can manage destination charges that are created on behalf of them.
    public var destinationOnBehalfOfChargeManagement: Bool?
    /// Whether responding to disputes is enabled, including submitting evidence and accepting disputes.
    public var disputeManagement: Bool?
    /// Whether sending refunds is enabled.
    public var refundManagement: Bool?

    public init(capturePayments: Bool? = nil,
                destinationOnBehalfOfChargeManagement: Bool? = nil,
                disputeManagement: Bool? = nil,
                refundManagement: Bool? = nil) {
        self.capturePayments = capturePayments
        self.destinationOnBehalfOfChargeManagement = destinationOnBehalfOfChargeManagement
        self.disputeManagement = disputeManagement
        self.refundManagement = refundManagement
    }
}

/// Features available for the `payment_disputes` embedded component.
public struct AccountSessionPaymentDisputesFeatures: Codable {
    /// Whether connected accounts can manage destination charges that are created on behalf of them.
    public var destinationOnBehalfOfChargeManagement: Bool?
    /// Whether responding to disputes is enabled, including submitting evidence and accepting disputes.
    public var disputeManagement: Bool?
    /// Whether sending refunds is enabled.
    public var refundManagement: Bool?

    public init(destinationOnBehalfOfChargeManagement: Bool? = nil,
                disputeManagement: Bool? = nil,
                refundManagement: Bool? = nil) {
        self.destinationOnBehalfOfChargeManagement = destinationOnBehalfOfChargeManagement
        self.disputeManagement = disputeManagement
        self.refundManagement = refundManagement
    }
}

/// Features available for the `financial_account` embedded component.
public struct AccountSessionFinancialAccountFeatures: Codable {
    /// Disables Stripe user authentication for this embedded component.
    public var disableStripeUserAuthentication: Bool?
    /// Whether to allow platforms to control bank account collection for their connected accounts.
    public var externalAccountCollection: Bool?
    /// Whether to allow sending money.
    public var sendMoney: Bool?
    /// Whether to allow transferring balance.
    public var transferBalance: Bool?

    public init(disableStripeUserAuthentication: Bool? = nil,
                externalAccountCollection: Bool? = nil,
                sendMoney: Bool? = nil,
                transferBalance: Bool? = nil) {
        self.disableStripeUserAuthentication = disableStripeUserAuthentication
        self.externalAccountCollection = externalAccountCollection
        self.sendMoney = sendMoney
        self.transferBalance = transferBalance
    }
}

/// Features available for the `financial_account_transactions` embedded component.
public struct AccountSessionFinancialAccountTransactionsFeatures: Codable {
    /// Whether to allow card spend dispute management features.
    public var cardSpendDisputeManagement: Bool?

    public init(cardSpendDisputeManagement: Bool? = nil) {
        self.cardSpendDisputeManagement = cardSpendDisputeManagement
    }
}

/// Features available for the `instant_payouts_promotion` embedded component.
public struct AccountSessionInstantPayoutsPromotionFeatures: Codable {
    /// Disables Stripe user authentication for this embedded component.
    public var disableStripeUserAuthentication: Bool?
    /// Whether to allow platforms to control bank account collection for their connected accounts.
    public var externalAccountCollection: Bool?
    /// Whether to allow creation of instant payouts.
    public var instantPayouts: AccountSessionInstantPayouts?

    public init(disableStripeUserAuthentication: Bool? = nil,
                externalAccountCollection: Bool? = nil,
                instantPayouts: AccountSessionInstantPayouts? = nil) {
        self.disableStripeUserAuthentication = disableStripeUserAuthentication
        self.externalAccountCollection = externalAccountCollection
        self.instantPayouts = instantPayouts
    }
}

/// Features available for the `issuing_card` embedded component.
public struct AccountSessionIssuingCardFeatures: Codable {
    /// Whether to allow card management features.
    public var cardManagement: Bool?
    /// Whether to allow card spend dispute management features.
    public var cardSpendDisputeManagement: Bool?
    /// Whether to allow cardholder management features.
    public var cardholderManagement: Bool?
    /// Whether to allow spend control management features.
    public var spendControlManagement: Bool?

    public init(cardManagement: Bool? = nil,
                cardSpendDisputeManagement: Bool? = nil,
                cardholderManagement: Bool? = nil,
                spendControlManagement: Bool? = nil) {
        self.cardManagement = cardManagement
        self.cardSpendDisputeManagement = cardSpendDisputeManagement
        self.cardholderManagement = cardholderManagement
        self.spendControlManagement = spendControlManagement
    }
}

/// Features available for the `issuing_cards_list` embedded component.
public struct AccountSessionIssuingCardsListFeatures: Codable {
    /// Whether to allow card management features.
    public var cardManagement: Bool?
    /// Whether to allow card spend dispute management features.
    public var cardSpendDisputeManagement: Bool?
    /// Whether to allow cardholder management features.
    public var cardholderManagement: Bool?
    /// Disables Stripe user authentication for this embedded component.
    public var disableStripeUserAuthentication: Bool?
    /// Whether to allow spend control management features.
    public var spendControlManagement: Bool?

    public init(cardManagement: Bool? = nil,
                cardSpendDisputeManagement: Bool? = nil,
                cardholderManagement: Bool? = nil,
                disableStripeUserAuthentication: Bool? = nil,
                spendControlManagement: Bool? = nil) {
        self.cardManagement = cardManagement
        self.cardSpendDisputeManagement = cardSpendDisputeManagement
        self.cardholderManagement = cardholderManagement
        self.disableStripeUserAuthentication = disableStripeUserAuthentication
        self.spendControlManagement = spendControlManagement
    }
}

/// Features available for the `notification_banner` embedded component.
public struct AccountSessionNotificationBannerFeatures: Codable {
    /// Disables Stripe user authentication for this embedded component.
    public var disableStripeUserAuthentication: Bool?
    /// Whether to allow platforms to control bank account collection for their connected accounts.
    public var externalAccountCollection: Bool?

    public init(disableStripeUserAuthentication: Bool? = nil, externalAccountCollection: Bool? = nil) {
        self.disableStripeUserAuthentication = disableStripeUserAuthentication
        self.externalAccountCollection = externalAccountCollection
    }
}

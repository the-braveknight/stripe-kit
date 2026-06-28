//
//  StripeClient.swift
//  Stripe
//
//  Created by Andrew Edwards on 4/30/19.
//

import NIO
import AsyncHTTPClient

/// A shared, long-lived entry point to the Stripe API.
///
/// `StripeClient` is a reference type so a single instance can be created once and
/// shared freely across tasks and actors. Its route handlers are immutable (`let`)
/// value types, which makes the `Sendable` conformance fully checked and race-free.
///
/// To customize headers for a request (e.g. an idempotency key), call the
/// non-mutating `addHeaders` directly on the route; it returns a copy with the
/// headers merged in, leaving the shared route untouched:
///
/// ```swift
/// let charge = try await client.charges
///     .addHeaders(["Idempotency-Key": key])
///     .create(...)
/// ```
public final class StripeClient: Sendable {
    // MARK: - CORE RESOURCES
    public let balances: BalanceRoutes
    public let balanceTransactions: BalanceTransactionRoutes
    public let charges: ChargeRoutes
    public let customers: CustomerRoutes
    public let disputes: DisputeRoutes
    public let events: EventRoutes
    public let files: FileRoutes
    public let fileLinks: FileLinkRoutes
    public let mandates: MandateRoutes
    public let paymentIntents: PaymentIntentRoutes
    public let setupIntents: SetupIntentsRoutes
    public let setupAttempts: SetupAttemptRoutes
    public let payouts: PayoutRoutes
    public let refunds: RefundRoutes
    public let tokens: TokenRoutes
    public let ephemeralKeys: EphemeralKeyRoutes
    
    // MARK: - PAYMENT METHODS
    public let paymentMethods: PaymentMethodRoutes
    public let bankAccounts: BankAccountRoutes
    public let cashBalances: CashBalanceRoutes
    public let cards: CardRoutes
//    public let sources: SourceRoutes
    
    // MARK: - CHECKOUT
    public let sessions: SessionRoutes
    
    // MARK: - PaymentLink
    public let paymentLinks: PaymentLinkRoutes
    
    // MARK: - Products
    public let products: ProductRoutes
    public let prices: PriceRoutes
    public let coupons: CouponRoutes
    public let promotionCodes: PromotionCodesRoutes
    public let discounts: DiscountRoutes
    public let taxCodes: TaxCodeRoutes
    public let taxRates: TaxRateRoutes
    public let shippingRates: ShippingRateRoutes
    
    // MARK: - BILLING
    public let creditNotes: CreditNoteRoutes
    public let customerBalanceTransactions: CustomerBalanceTransactionRoutes
    public let portalSession: PortalSessionRoutes
    public let portalConfiguration: PortalConfigurationRoutes
    public let customerTaxIds: CustomerTaxIDRoutes
    public let invoices: InvoiceRoutes
    public let invoiceItems: InvoiceItemRoutes
    public let plans: PlanRoutes
    public let subscriptions: SubscriptionRoutes
    public let subscriptionItems: SubscriptionItemRoutes
    public let subscriptionSchedules: SubscriptionScheduleRoutes
    public let usageRecords: UsageRecordRoutes
    public let quoteLineItems: QuoteLineItemRoutes
    public let quotes: QuoteRoutes
    public let testClocks: TestClockRoutes
    
    // MARK: - CONNECT
    public let connectAccounts: AccountRoutes
    public let accountSessions: AccountSessionRoutes
    public let accountLinks: AccountLinkRoutes
    public let applicationFees: ApplicationFeesRoutes
    public let applicationFeeRefunds: ApplicationFeeRefundRoutes
    public let capabilities: CapabilitiesRoutes
    public let countrySpecs: CountrySpecRoutes
    public let externalAccounts: ExternalAccountsRoutes
    public let persons: PersonRoutes
    public let topups: TopUpRoutes
    public let transfers: TransferRoutes
    public let transferReversals: TransferReversalRoutes
    public let secretManager: SecretRoutes
    
    // MARK: - FRAUD
    public let earlyFraudWarnings: EarlyFraudWarningRoutes
    public let reviews: ReviewRoutes
    public let valueLists: ValueListRoutes
    public let valueListItems: ValueListItemRoutes
    
    // MARK: - ISSUING
    public let authorizations: AuthorizationRoutes
    public let cardholders: CardholderRoutes
    public let issuingCards: IssuingCardRoutes
    public let issuingDisputes: IssuingDisputeRoutes
    public let fundingInstructions: FundingInstructionsRoutes
    public let transactions: TransactionRoutes
    
    // MARK: - TERMINAL
    public let terminalConnectionTokens: TerminalConnectionTokenRoutes
    public let terminalLocations: TerminalLocationRoutes
    public let terminalReaders: TerminalReaderRoutes
    public let terminalHardwareOrders: TerminalHardwareOrderRoutes
    public let terminalHardwareProducts: TerminalHardwareProductRoutes
    public let terminalHardwareSkus: TerminalHardwareSKURoutes
    public let terminalHardwareShippingMethods: TerminalHardwareShippingMethodRoutes
    public let terminalConfiguration: TerminalConfigurationRoutes
        
    // MARK: - SIGMA
    public let scheduledQueryRuns: ScheduledQueryRunRoutes

    // MARK: - REPORTING
    public let reportRuns: ReportRunRoutes
    public let reportTypes: ReportTypeRoutes
    
    // MARK: - IDENTITY
    public let verificationSessions: VerificationSessionRoutes
    public let verificationReports: VerificationReportRoutes
    
    // MARK: - WEBHOOKS
    public let webhookEndpoints: WebhookEndpointRoutes
    
    let handler: StripeAPIHandler
    
    /// Returns a StripeClient used to interact with the Stripe APIs.
    /// - Parameter httpClient: An `HTTPClient`used to communicate wiith the Stripe API
    /// - Parameter apiKey: A Stripe API key.
    public init(httpClient: HTTPClient, apiKey: String) {
        handler = StripeAPIHandler(httpClient: httpClient, apiKey: apiKey)
        
        balances = StripeBalanceRoutes(apiHandler: handler)
        balanceTransactions = StripeBalanceTransactionRoutes(apiHandler: handler)
        charges = StripeChargeRoutes(apiHandler: handler)
        customers = StripeCustomerRoutes(apiHandler: handler)
        disputes = StripeDisputeRoutes(apiHandler: handler)
        events = StripeEventRoutes(apiHandler: handler)
        files = StripeFileRoutes(apiHandler: handler)
        fileLinks = StripeFileLinkRoutes(apiHandler: handler)
        mandates = StripeMandateRoutes(apiHandler: handler)
        paymentIntents = StripePaymentIntentRoutes(apiHandler: handler)
        setupIntents = StripeSetupIntentsRoutes(apiHandler: handler)
        setupAttempts = StripeSetupAttemptRoutes(apiHandler: handler)
        payouts = StripePayoutRoutes(apiHandler: handler)
        refunds = StripeRefundRoutes(apiHandler: handler)
        tokens = StripeTokenRoutes(apiHandler: handler)
        ephemeralKeys = StripeEphemeralKeyRoutes(apiHandler: handler)
        
        paymentMethods = StripePaymentMethodRoutes(apiHandler: handler)
        bankAccounts = StripeBankAccountRoutes(apiHandler: handler)
        cashBalances = StripeCashBalanceRoutes(apiHandler: handler)
        cards = StripeCardRoutes(apiHandler: handler)
//        sources = StripeSourceRoutes(apiHandler: handler)
        
        sessions = StripeSessionRoutes(apiHandler: handler)
        
        paymentLinks = StripePaymentLinkRoutes(apiHandler: handler)
        
        products = StripeProductRoutes(apiHandler: handler)
        prices = StripePriceRoutes(apiHandler: handler)
        coupons = StripeCouponRoutes(apiHandler: handler)
        promotionCodes = StripePromotionCodesRoutes(apiHandler: handler)
        discounts = StripeDiscountRoutes(apiHandler: handler)
        taxCodes = StripeTaxCodeRoutes(apiHandler: handler)
        taxRates = StripeTaxRateRoutes(apiHandler: handler)
        shippingRates = StripeShippingRateRoutes(apiHandler: handler)
        
        creditNotes = StripeCreditNoteRoutes(apiHandler: handler)
        customerBalanceTransactions = StripeCustomerBalanceTransactionRoutes(apiHandler: handler)
        portalSession = StripePortalSessionRoutes(apiHandler: handler)
        portalConfiguration = StripePortalConfigurationRoutes(apiHandler: handler)
        customerTaxIds = StripeCustomerTaxIDRoutes(apiHandler: handler)
        invoices = StripeInvoiceRoutes(apiHandler: handler)
        invoiceItems = StripeInvoiceItemRoutes(apiHandler: handler)
        plans = StripePlanRoutes(apiHandler: handler)
        subscriptions = StripeSubscriptionRoutes(apiHandler: handler)
        subscriptionItems = StripeSubscriptionItemRoutes(apiHandler: handler)
        subscriptionSchedules = StripeSubscriptionScheduleRoutes(apiHandler: handler)
        usageRecords = StripeUsageRecordRoutes(apiHandler: handler)
        quoteLineItems = StripeQuoteLineItemRoutes(apiHandler: handler)
        quotes = StripeQuoteRoutes(apiHandler: handler)
        testClocks = StripeTestClockRoutes(apiHandler: handler)
        
        connectAccounts = StripeConnectAccountRoutes(apiHandler: handler)
        accountSessions =  StripeAccountSessionsRoutes(apiHandler: handler)
        accountLinks = StripeAccountLinkRoutes(apiHandler: handler)
        applicationFees = StripeApplicationFeeRoutes(apiHandler: handler)
        applicationFeeRefunds = StripeApplicationFeeRefundRoutes(apiHandler: handler)
        capabilities = StripeCapabilitiesRoutes(apiHandler: handler)
        countrySpecs = StripeCountrySpecRoutes(apiHandler: handler)
        externalAccounts = StripeExternalAccountsRoutes(apiHandler: handler)
        persons = StripePersonRoutes(apiHandler: handler)
        topups = StripeTopUpRoutes(apiHandler: handler)
        transfers = StripeTransferRoutes(apiHandler: handler)
        transferReversals = StripeTransferReversalRoutes(apiHandler: handler)
        secretManager = StripeSecretRoutes(apiHandler: handler)
        
        earlyFraudWarnings = StripeEarlyFraudWarningRoutes(apiHandler: handler)
        reviews = StripeReviewRoutes(apiHandler: handler)
        valueLists = StripeValueListRoutes(apiHandler: handler)
        valueListItems = StripeValueListItemRoutes(apiHandler: handler)
        
        authorizations = StripeAuthorizationRoutes(apiHandler: handler)
        cardholders = StripeCardholderRoutes(apiHandler: handler)
        issuingCards = StripeIssuingCardRoutes(apiHandler: handler)
        issuingDisputes = StripeIssuingDisputeRoutes(apiHandler: handler)
        fundingInstructions = StripeFundingInstructionsRoutes(apiHandler: handler)
        transactions = StripeTransactionRoutes(apiHandler: handler)
        
        terminalConnectionTokens = StripeTerminalConnectionTokenRoutes(apiHandler: handler)
        terminalLocations = StripeTerminalLocationRoutes(apiHandler: handler)
        terminalReaders = StripeTerminalReaderRoutes(apiHandler: handler)
        terminalHardwareOrders = StripeTerminalHardwareOrderRoutes(apiHandler: handler)
        terminalHardwareProducts = StripeTerminalHardwareProductRoutes(apiHandler: handler)
        terminalHardwareSkus = StripeTerminalHardwareSKURoutes(apiHandler: handler)
        terminalHardwareShippingMethods = StripeTerminalHardwareShippingMethodRoutes(apiHandler: handler)
        terminalConfiguration = StripeTerminalConfigurationRoutes(apiHandler: handler)
        
        scheduledQueryRuns = StripeScheduledQueryRunRoutes(apiHandler: handler)
        
        reportRuns = StripeReportRunRoutes(apiHandler: handler)
        reportTypes = StripeReportTypeRoutes(apiHandler: handler)
        
        verificationSessions = StripeVerificationSessionRoutes(apiHandler: handler)
        verificationReports = StripeVerificationReportRoutes(apiHandler: handler)
        
        webhookEndpoints = StripeWebhookEndpointRoutes(apiHandler: handler)
    }
}

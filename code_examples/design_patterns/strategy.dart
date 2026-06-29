abstract class PaymentStrategy {
  void pay(double amount);
}

class CreditCardPayment implements PaymentStrategy {
  final String cardNumber;

  CreditCardPayment(this.cardNumber);

  @override
  void pay(double amount) {
    print('Paid \$${amount.toStringAsFixed(2)} using Credit Card: $cardNumber');
  }
}

class PayPalPayment implements PaymentStrategy {
  final String email;

  PayPalPayment(this.email);

  @override
  void pay(double amount) {
    print('Paid \$${amount.toStringAsFixed(2)} using PayPal: $email');
  }
}

class BitcoinPayment implements PaymentStrategy {
  final String walletAddress;

  BitcoinPayment(this.walletAddress);

  @override
  void pay(double amount) {
    print('Paid \$${amount.toStringAsFixed(2)} using Bitcoin: $walletAddress');
  }
}

class PaymentContext {
  PaymentStrategy? _paymentStrategy;

  void setPaymentStrategy(PaymentStrategy strategy) {
    _paymentStrategy = strategy;
  }

  void pay(double amount) {
    if (_paymentStrategy == null) {
      print('No payment strategy selected!');
      return;
    }
    _paymentStrategy!.pay(amount);
  }
}

void main() {
  PaymentContext paymentContext = PaymentContext();

  // Using Credit Card Payment
  paymentContext.setPaymentStrategy(CreditCardPayment('1234-5678-9012-3456'));
  paymentContext.pay(100.0);

  // Using PayPal Payment
  paymentContext.setPaymentStrategy(PayPalPayment('user@example.com'));
  paymentContext.pay(200.0);

  // Using Bitcoin Payment
  paymentContext
      .setPaymentStrategy(BitcoinPayment('1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa'));
  paymentContext.pay(0.05);
}
// Paid $100.00 using Credit Card: 1234-5678-9012-3456
// Paid $200.00 using PayPal: user@example.com
// Paid $0.05 using Bitcoin: 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa


// The Strategy Pattern is a behavioral design pattern that allows you to define a family of algorithms,
// put each of them in a separate class, and make their objects interchangeable.
// This pattern is useful for scenarios where you want to select an algorithm’s behavior at runtime.
//
// Here’s a simple example in Dart:
//
// Scenario
// We will create a system where different strategies are used for payment processing
// (e.g., CreditCardPayment, PayPalPayment, BitcoinPayment).
//
// Step 1: Define the Strategy Interface

// abstract class PaymentStrategy {
//   void pay(double amount);
// }
// Step 2: Implement Concrete Strategies

// class CreditCardPayment implements PaymentStrategy {
//   final String cardNumber;
//
//   CreditCardPayment(this.cardNumber);
//
//   @override
//   void pay(double amount) {
//     print('Paid \$${amount.toStringAsFixed(2)} using Credit Card: $cardNumber');
//   }
// }
//
// class PayPalPayment implements PaymentStrategy {
//   final String email;
//
//   PayPalPayment(this.email);
//
//   @override
//   void pay(double amount) {
//     print('Paid \$${amount.toStringAsFixed(2)} using PayPal: $email');
//   }
// }
//
// class BitcoinPayment implements PaymentStrategy {
//   final String walletAddress;
//
//   BitcoinPayment(this.walletAddress);
//
//   @override
//   void pay(double amount) {
//     print('Paid \$${amount.toStringAsFixed(2)} using Bitcoin: $walletAddress');
//   }
// }
// Step 3: Create the Context Class
// The PaymentContext will use the strategy to execute the payment.
//

// class PaymentContext {
//   PaymentStrategy? _paymentStrategy;
//
//   void setPaymentStrategy(PaymentStrategy strategy) {
//     _paymentStrategy = strategy;
//   }
//
//   void pay(double amount) {
//     if (_paymentStrategy == null) {
//       print('No payment strategy selected!');
//       return;
//     }
//     _paymentStrategy!.pay(amount);
//   }
// }
// Step 4: Use the Strategy Pattern

// void main() {
//   PaymentContext paymentContext = PaymentContext();
//
//   // Using Credit Card Payment
//   paymentContext.setPaymentStrategy(CreditCardPayment('1234-5678-9012-3456'));
//   paymentContext.pay(100.0);
//
//   // Using PayPal Payment
//   paymentContext.setPaymentStrategy(PayPalPayment('user@example.com'));
//   paymentContext.pay(200.0);
//
//   // Using Bitcoin Payment
//   paymentContext.setPaymentStrategy(BitcoinPayment('1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa'));
//   paymentContext.pay(0.05);
// }
// Output
// Paid $100.00 using Credit Card: 1234-5678-9012-3456
// Paid $200.00 using PayPal: user@example.com
// Paid $0.05 using Bitcoin: 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa
// Explanation
// Strategy Interface (PaymentStrategy): Defines the common interface for all payment strategies.
// Concrete Strategies (CreditCardPayment, PayPalPayment, BitcoinPayment): Implement the payment logic.
// Context (PaymentContext): Allows the strategy to be set at runtime and uses it to perform the payment.
// This demonstrates the flexibility of the Strategy Pattern to switch between different algorithms or strategies dynamically.

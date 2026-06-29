class House {
  String? foundation;
  String? structure;
  String? roof;
  bool? hasSwimmingPool;
  bool? hasGarage;
  bool? hasGarden;

  @override
  String toString() {
    return '''
    House:
      Foundation: $foundation
      Structure: $structure
      Roof: $roof
      Swimming Pool: $hasSwimmingPool
      Garage: $hasGarage
      Garden: $hasGarden
    ''';
  }
}


abstract class HouseBuilder {
  void buildFoundation();
  void buildStructure();
  void buildRoof();
  void addSwimmingPool();
  void addGarage();
  void addGarden();
  House getHouse();
}

class LuxuryHouseBuilder implements HouseBuilder {
  final House _house = House();

  @override
  void buildFoundation() {
    _house.foundation = "Concrete, steel, and reinforced beams";
  }

  @override
  void buildStructure() {
    _house.structure = "Modern steel and glass structure";
  }

  @override
  void buildRoof() {
    _house.roof = "Glass and solar panels";
  }

  @override
  void addSwimmingPool() {
    _house.hasSwimmingPool = true;
  }

  @override
  void addGarage() {
    _house.hasGarage = true;
  }

  @override
  void addGarden() {
    _house.hasGarden = true;
  }

  @override
  House getHouse() {
    return _house;
  }
}

class HouseDirector {
  final HouseBuilder builder;

  HouseDirector(this.builder);

  House constructLuxuryHouse() {
    builder.buildFoundation();
    builder.buildStructure();
    builder.buildRoof();
    builder.addSwimmingPool();
    builder.addGarage();
    builder.addGarden();
    return builder.getHouse();
  }

  House constructSimpleHouse() {
    builder.buildFoundation();
    builder.buildStructure();
    builder.buildRoof();
    return builder.getHouse();
  }
}

void main() {
  // Create a LuxuryHouseBuilder instance
  LuxuryHouseBuilder luxuryBuilder = LuxuryHouseBuilder();

  // Use the Director to construct a luxury house
  HouseDirector director = HouseDirector(luxuryBuilder);

  // Construct a luxury house
  House luxuryHouse = director.constructLuxuryHouse();
  print("Luxury House Built:\n$luxuryHouse");

  // Construct a simple house with fewer features
  House simpleHouse = director.constructSimpleHouse();
  print("Simple House Built:\n$simpleHouse");
}
// Builder Design Pattern
// The Builder Design Pattern is a creational pattern that provides a way to construct complex objects step-by-step.
// It separates the construction of an object from its representation,
// allowing the same construction process to create different representations.
//
// When to Use the Builder Pattern?
// When you need to create complex objects with many optional fields or configurations.
// When the construction process involves multiple steps or variations.
// To improve the readability of the object creation process by avoiding complex constructors.
// Key Components
// Product: The complex object being built.
// Builder: Abstract interface defining the steps to build the product.
// Concrete Builder: Implements the Builder interface and provides specific implementations for building parts of the product.
// Director (Optional): Oversees the construction process, ensuring it follows a specific order.
// Client: Uses the builder to create the product.
// Example in Dart
// Scenario: Building a House object with optional features like a swimming pool, garage, and garden.
// 1. Product (House)
// class House {
//   String? foundation;
//   String? structure;
//   String? roof;
//   bool? hasSwimmingPool;
//   bool? hasGarage;
//   bool? hasGarden;
//
//   @override
//   String toString() {
//     return '''
//     House:
//       Foundation: $foundation
//       Structure: $structure
//       Roof: $roof
//       Swimming Pool: $hasSwimmingPool
//       Garage: $hasGarage
//       Garden: $hasGarden
//     ''';
//   }
// }
// 2. Builder Interface (HouseBuilder)
// dart
// Copy code
// abstract class HouseBuilder {
//   void buildFoundation();
//   void buildStructure();
//   void buildRoof();
//   void addSwimmingPool();
//   void addGarage();
//   void addGarden();
//   House getHouse();
// }
// 3. Concrete Builder (LuxuryHouseBuilder)

// class LuxuryHouseBuilder implements HouseBuilder {
//   final House _house = House();
//
//   @override
//   void buildFoundation() {
//     _house.foundation = "Concrete, steel, and reinforced beams";
//   }
//
//   @override
//   void buildStructure() {
//     _house.structure = "Modern steel and glass structure";
//   }
//
//   @override
//   void buildRoof() {
//     _house.roof = "Glass and solar panels";
//   }
//
//   @override
//   void addSwimmingPool() {
//     _house.hasSwimmingPool = true;
//   }
//
//   @override
//   void addGarage() {
//     _house.hasGarage = true;
//   }
//
//   @override
//   void addGarden() {
//     _house.hasGarden = true;
//   }
//
//   @override
//   House getHouse() {
//     return _house;
//   }
// }
// 4. Director (HouseDirector)
// The director ensures the builder follows a specific construction sequence.
//
// class HouseDirector {
//   final HouseBuilder builder;
//
//   HouseDirector(this.builder);
//
//   House constructLuxuryHouse() {
//     builder.buildFoundation();
//     builder.buildStructure();
//     builder.buildRoof();
//     builder.addSwimmingPool();
//     builder.addGarage();
//     builder.addGarden();
//     return builder.getHouse();
//   }
//
//   House constructSimpleHouse() {
//     builder.buildFoundation();
//     builder.buildStructure();
//     builder.buildRoof();
//     return builder.getHouse();
//   }
// }
// 5. Client
// void main() {
//   // Create a LuxuryHouseBuilder instance
//   LuxuryHouseBuilder luxuryBuilder = LuxuryHouseBuilder();
//
//   // Use the Director to construct a luxury house
//   HouseDirector director = HouseDirector(luxuryBuilder);
//
//   // Construct a luxury house
//   House luxuryHouse = director.constructLuxuryHouse();
//   print("Luxury House Built:\n$luxuryHouse");
//
//   // Construct a simple house with fewer features
//   House simpleHouse = director.constructSimpleHouse();
//   print("Simple House Built:\n$simpleHouse");
// }
// Output

// Luxury House Built:
//     House:
//       Foundation: Concrete, steel, and reinforced beams
//       Structure: Modern steel and glass structure
//       Roof: Glass and solar panels
//       Swimming Pool: true
//       Garage: true
//       Garden: true
//
// Simple House Built:
//     House:
//       Foundation: Concrete, steel, and reinforced beams
//       Structure: Modern steel and glass structure
//       Roof: Glass and solar panels
//       Swimming Pool: null
//       Garage: null
//       Garden: null
// Explanation
// House: Represents the final product with various properties.
// HouseBuilder: Abstract interface defining the methods to build parts of a House.
// LuxuryHouseBuilder: Implements the builder interface to build a luxury house with optional features.
// HouseDirector: Orchestrates the building process, ensuring a consistent construction sequence.
// Client (main): Interacts with the Director and Builder to create different types of houses.
// Benefits of Builder Pattern
// Step-by-Step Construction: Helps build complex objects step-by-step.
// Flexibility: The same construction process can create different objects.
// Readability and Maintainability: Improves the readability of object creation by avoiding lengthy or complex constructors.
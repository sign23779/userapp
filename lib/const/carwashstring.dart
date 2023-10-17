class Car {
  static var cars = [
    {
      'type': 'HATCHBACK',
      'carimage':
          'https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fcar%2Fhatchbackcar.png?alt=media&token=47078606-3843-4492-9fd1-743c0788c3b9'
    },
    {
      'type': 'SEDAN',
      'carimage':
          'https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fcar%2Fsedancar.jpg?alt=media&token=e98dddbc-847d-4160-9342-49613708a6d2'
    },
    {
      'type': 'SUV',
      'carimage':
          'https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fcar%2Fsuvcar.jpg?alt=media&token=5634f1f6-4daa-49dd-a951-8de7b649f78c'
    }
  ];
}

class Cars {
  static List<Map<String, dynamic>> getwashdetails(name) {
    if (name == 'hatchback') {
      return [
        {
          "heading": "BASIC WASH",
          "image":
              "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fwashing%2Fbasiccarwash.jpg?alt=media&token=84b1c15f-5af4-45bd-94db-2b6f197ed6f3",
          "price": "350",
          'subheading':
              "Hand water wash\nShampoo wash\nInterior polish\nFloor mat polish\nTyre polish\nInterior vaccum"
        },
        {
          "heading": "PRO WASH",
          "image":
              "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fwashing%2Fprocarwash.jpg?alt=media&token=6740642d-6a31-403d-8ceb-e91ade7fe68f",
          "price": "500",
          'subheading':
              "Exterior pressure wash\nExterior form wash\nInterior polish\nTyre polish\nInterior vaccum"
        },
        {
          "heading": "EXTREME WASH",
          "image":
              "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fwashing%2Fextremecarwash.jpg?alt=media&token=91f91ca8-93c4-46bf-b019-be6908f79b67",
          "price": "2000",
          'subheading':
              "Full car detailing includes\nExterior pressure wash\nExterior and Interior polish\nExterior and Interior foam wash\nTyre polish & detailing\nScratch & watermark removal\nCar polish wax & ceramic coating\nPaint free polish\nTop roof cleaning"
        },
      ];
    } else if (name == 'sedan') {
      return [
        {
          "heading": "BASIC WASH",
          "image":
              "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fwashing%2Fbasiccarwash.jpg?alt=media&token=84b1c15f-5af4-45bd-94db-2b6f197ed6f3",
          "price": "350",
          'subheading':
              "Hand water wash\nShampoo wash\nInterior polish\nFloor mat polish\nTyre polish\nInterior vaccum"
        },
        {
          "heading": "PRO WASH",
          "image":
              "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fwashing%2Fprocarwash.jpg?alt=media&token=6740642d-6a31-403d-8ceb-e91ade7fe68f",
          "price": "500",
          'subheading':
              "Exterior pressure wash\nExterior form wash\nInterior polish\nTyre polish\nInterior vaccum"
        },
        {
          "heading": "EXTREME WASH",
          "image":
              "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fwashing%2Fextremecarwash.jpg?alt=media&token=91f91ca8-93c4-46bf-b019-be6908f79b67",
          "price": "2000",
          'subheading':
              "Full car detailing includes\nExterior pressure wash\nExterior and Interior polish\nExterior and Interior foam wash\nTyre polish & detailing\nScratch & watermark removal\nCar polish wax & ceramic coating\nPaint free polish\nTop roof cleaning"
        },
      ];
    } else if (name == 'suv') {
      return [
        {
          "heading": "BASIC WASH",
          "image":
              "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fwashing%2Fbasiccarwash.jpg?alt=media&token=84b1c15f-5af4-45bd-94db-2b6f197ed6f3",
          "price": "400",
          'subheading':
              "Hand water wash\nShampoo wash\nInterior polish\nFloor mat polish\nTyre polish\nInterior vaccum"
        },
        {
          "heading": "PRO WASH",
          "image":
              "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fwashing%2Fprocarwash.jpg?alt=media&token=6740642d-6a31-403d-8ceb-e91ade7fe68f",
          "price": "600",
          'subheading':
              "Exterior pressure wash\nExterior form wash\nInterior polish\nTyre polish\nInterior vaccum"
        },
        {
          "heading": "EXTREME WASH",
          "image":
              "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fwashing%2Fextremecarwash.jpg?alt=media&token=91f91ca8-93c4-46bf-b019-be6908f79b67",
          "price": "2400",
          'subheading':
              "Full car detailing includes\nExterior pressure wash\nExterior and Interior polish\nExterior and Interior foam wash\nTyre polish & detailing\nScratch & watermark removal\nCar polish wax & ceramic coating\nPaint free polish\nTop roof cleaning"
        },
      ];
    } else {
      return [{}];
    }
  }
}

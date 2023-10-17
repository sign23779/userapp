class Service {
  static Map getdata(name) {
    if (name == 'interior designs') {
      return {
        'backgroundimg':
            "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fservice%2Finterior.jpg?alt=media&token=b860ef1a-4e73-4d52-a1d4-e09feb21f689",
        'imageheading': 'Interior design',
        'mainheading': 'Interior Designs',
        'subheading':
            'Interior design material\nrepair and service\nDetailed issue diagnosis with\nsame day resolution',
        'price': '1000',
        'cartimage':
            "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fcleaning%20and%20service%2Finterior.png?alt=media&token=f52ca9c7-454f-4a78-bbf9-3f01726d7a8e",
        "mainheadingtwo": 'Details',
        "details":
            "60-minute virtual consultation with one of our \nInterior Designers to provide for us to understand your needs\nand provide amazing solutions to refresh your space.\n\nPersonalised advice on Furnishing and advice on products\nand relevant Services.\nSupport in placing the order virtually"
      };
    } else if (name == 'tiles service') {
      return {
        'backgroundimg':
            "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fservice%2Ftile.jpg?alt=media&token=e62b50ad-48d7-426c-9ad4-1202296059df",
        'imageheading': 'Tiles',
        'mainheading': 'Tiles Service',
        'subheading':
            'Replacing the broken tile into\nnew one\nDetailed issue diagnosis with\nsame day resolution',
        'price': '1000',
        'cartimage':
            "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fcleaning%20and%20service%2Ftile.png?alt=media&token=24cf52b9-d846-44d0-b220-5f242eb60dd1",
        "mainheadingtwo": 'Details',
        "details":
            "Our skilled team provides expert tile installation\n\nWe offer a diverse selection of high-quality tiles, \nincluding ceramic, porcelain, natural stone, and more\nOur tile service includes personalized design solutions,\nhelping you create unique patterns, layouts"
      };
    } else if (name == 'sofa / chairmanufacturing') {
      return {
        'backgroundimg':
            "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fservice%2Fsofachair.jpg?alt=media&token=20216877-368f-46cf-9dcd-8696108ac423",
        'imageheading': 'Sofa and Chair',
        'mainheading': 'Sofa/Chair Manufacturing',
        'subheading':
            'Replacing the defective part. Spare\nparts rate are applicable as per rate\ncard\n\nThorough cleaning wings and head',
        'price': '1000',
        'cartimage':
            "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fcleaning%20and%20service%2Fsofaservice.png?alt=media&token=3b972be6-be0d-4b4e-8d11-2dfd40a74784",
        "mainheadingtwo": 'Details',
        "details":
            "We provide professional upholstery cleaning services\nto refresh and revitalize sofas and chairs.\n\nWe also offers expert repair and restoration services for\nsofas and chairs that have suffered from damage,\nsuch as broken frames, sagging cushions,\nor torn upholstery"
      };
    } else if (name == 'painting') {
      return {
        'backgroundimg':
            "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fservice%2Fpainting.png?alt=media&token=670bd599-e8d2-4361-87cc-4efa0ebcb9a0",
        'imageheading': 'Painting',
        'mainheading': 'Painting',
        'subheading':
            'Accurate quotation.\nTrained and verified painters\n\nEnd to end Management',
        'price': '1000',
        'cartimage':
            "https://firebasestorage.googleapis.com/v0/b/noduster-827be.appspot.com/o/images%2Fcleaning%20and%20service%2Finterior.png?alt=media&token=f52ca9c7-454f-4a78-bbf9-3f01726d7a8e",
        "mainheadingtwo": 'Details',
        "details":
            "Consultation followed by quick & cost-effective painting\nservice\n\nBest for painting your rental property during\nmove-in / move-out"
      };
    } else {
      return {};
    }
  }
}

import 'package:sale_app/Src/Models/cart_item_models.dart';
import 'package:sale_app/Src/Models/item_models.dart';
import 'package:sale_app/Src/Models/user_models.dart';
import 'package:sale_app/Src/Models/order_models.dart';

itemModels cai = itemModels(
  itemName: 'Cải bẹ',
  imgUrl: [
    './assets/caibe-removebg-preview.png',
    './assets/hela.jpeg',
    './assets/namduiga.jpeg',
  ],
  unit: 'kg',
  price: 13500,
  description: 'Cải bẹ xanh baby gói 300g',
);
itemModels he = itemModels(
  itemName: 'Hẹ lá',
  imgUrl: [
    './assets/hela.jpeg',
    './assets/hela.jpeg',
    './assets/hela.jpeg',
  ],
  unit: 'kg',
  price: 13500,
  description: 'Cải bẹ xanh baby gói 300g',
);
itemModels nam = itemModels(
  itemName: 'Nấm đùi gà',
  imgUrl: [
    './assets/namduiga.jpeg',
    './assets/namduiga.jpeg',
    './assets/namduiga.jpeg',
    './assets/namduiga.jpeg',
  ],
  unit: 'kg',
  price: 13500,
  description: 'Cải bẹ xanh baby gói 300g',
);
itemModels ngo = itemModels(
  itemName: 'Ngò gai',
  imgUrl: [
    './assets/ngogai.jpeg',
    './assets/ngogai.jpeg',
    './assets/ngogai.jpeg',
    './assets/ngogai.jpeg',
  ],
  unit: 'kg',
  price: 13500,
  description: 'Cải bẹ xanh baby gói 300g',
);
itemModels rau = itemModels(
  itemName: 'Rau thơm',
  imgUrl: [
    './assets/rauthom.jpeg',
    './assets/rauthom.jpeg',
    './assets/rauthom.jpeg',
    './assets/rauthom.jpeg',
  ],
  unit: 'kg',
  price: 13500,
  description: 'Cải bẹ xanh baby gói 300g',
);
itemModels sa = itemModels(
  itemName: 'Sả cây',
  imgUrl: [
    './assets/sa.jpeg',
    './assets/sa.jpeg',
    './assets/sa.jpeg',
  ],
  unit: 'kg',
  price: 15500000,
  description: 'Cải bẹ xanh baby gói 300g',
);

List<itemModels> items = [
  cai,
  he,
  nam,
  ngo,
  rau,
  sa,
];
List<String> Categories = [
  'cauliflower',
  'eggplant',
  'cabbage',
  'broccoli',
  'perilla leaf',
  'celery',
  'cacarot'
];

List<CartItemModels> cartItem = [
  CartItemModels(item: cai, quantity: 2),
  CartItemModels(item: he, quantity: 3),
  CartItemModels(item: ngo, quantity: 1),
  CartItemModels(item: cai, quantity: 2),
  CartItemModels(item: he, quantity: 3),
  CartItemModels(item: ngo, quantity: 1),
  CartItemModels(item: cai, quantity: 2),
  CartItemModels(item: he, quantity: 3),
  CartItemModels(item: ngo, quantity: 1),
];

UserModel user = UserModel(
  name: 'Võ Ngọc Hiện',
  email: 'hienvo661@gmail.com',
  phone: '0989680851',
  CPF: '999999999',
  password: '',
);

List<OrderModel> order = [
  //order 1
  OrderModel(
    id: 'id1',
    create_DateTime: DateTime.parse('2022-08-06 20:19:10'),
    overdie_DateTime: DateTime.parse('2023-08-06 20:29:00'),
    item: [
      CartItemModels(item: cai, quantity: 3),
      CartItemModels(item: he, quantity: 3),
    ],
    status: 'delivered',
    CopyandPaste: 'hdhakan7g12',
    total: 15000,
  ),
  //order 2
  OrderModel(
    id: 'id2',
    create_DateTime: DateTime.parse('2022-08-06 20:19:10'),
    overdie_DateTime: DateTime.parse('2022-10-08 20:29:00'),
    item: [
      CartItemModels(item: ngo, quantity: 2),
      CartItemModels(item: nam, quantity: 1),
    ],
    status: 'pending payment',
    CopyandPaste: 'hdhakan7g12',
    total: 15000,
  ),
];

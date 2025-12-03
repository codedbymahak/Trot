'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "b8d0fbe7d1dfebbd5c0a7444f38eaba3",
"version.json": "ea975e94efc37767d6e7fab192ccb139",
"index.html": "7619a56a142fdea856c9c0e89226e400",
"/": "7619a56a142fdea856c9c0e89226e400",
"main.dart.js": "9b59c86ef384cb2108e6f2223c41b4e5",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "b8f93cd60291764c24a362117c6fd4a3",
"assets/AssetManifest.json": "f796a8d3af9b7a178cf0751aa7c4291c",
"assets/NOTICES": "beaeb80e9bd6c0b15e8a665c3d8240bb",
"assets/FontManifest.json": "584fc5c3824029391f4b22dcaccf577f",
"assets/AssetManifest.bin.json": "a9ea1b88a0bb908408f9ebcadd784735",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/ionicons/assets/fonts/Ionicons.ttf": "a48ca9e5bcc89fccac32592416234257",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "80ce7aac48c207cb955e3601c064b63c",
"assets/fonts/MaterialIcons-Regular.otf": "8ebb941544729799bc2b4d0af2297596",
"assets/assets/images/notre_dame.jpeg": "974e5cee4b756b25117e5d9df08c6e6f",
"assets/assets/images/hawaii.jpeg": "229040fc6aa2ef44d3fe8443ab3b483d",
"assets/assets/images/harbin_fur.jpeg": "62ffc8e4ba0673f1de62b4e970713eaa",
"assets/assets/images/barcelona_main.jpeg": "379f002cde5c2494d72889795dc804f8",
"assets/assets/images/cairo_ful_medames.jpeg": "f0e66c17c41618fcd1d1c55e678cc9c2",
"assets/assets/images/reykjavik_lava_jewelry.jpeg": "88ab47b2fd20655c2f22ba4c4eb1b4de",
"assets/assets/images/bali_coffee.jpeg": "500edb1cdb385c189acee96238da142d",
"assets/assets/images/bg3.jpeg": "9ca3a7e122d3995f793a9456c3ccb94e",
"assets/assets/images/dubai_shawarma.jpeg": "90388956686db37d1f172d2f20022676",
"assets/assets/images/page1bg.jpeg": "efae0b3bc26d27431c57c397f3b433bc",
"assets/assets/images/harbin_handicraft.jpeg": "98a389602822ec0a1613514bb6fde2b0",
"assets/assets/images/reykjavik_blue_lagoon.jpeg": "c86cc781d1af09292adc85b770edf3bc",
"assets/assets/images/macaron.jpeg": "373e5502bba2c8d7758a84a91de84652",
"assets/assets/images/harbin_ice_festival.jpeg": "0537367f5f4e59deef516b135f0fd013",
"assets/assets/images/istanbul_metro.jpeg": "1ab571b31ca86d08fbaaf0ed2798ec10",
"assets/assets/images/reykjavik_hotel1.jpeg": "febcf831b8468ba393cf3181fd6cbb65",
"assets/assets/images/zermatt.jpeg": "ad65e472ae16151e8430f245c71bf939",
"assets/assets/images/istanbul_hotel3.jpeg": "af4682db22a3553a0f19c934a5600598",
"assets/assets/images/harbin_hotel3.jpeg": "e6468fe7c2d7325e942912fe4bd76a16",
"assets/assets/images/dubai_fountain.jpeg": "8000b8dceaa99f77f2d89e2f1d90f198",
"assets/assets/images/rug.jpeg": "19a35d69425b3440039b277a809c62fc",
"assets/assets/images/galata_tower.jpeg": "8c0ec312a628976196f3446f46abf4d5",
"assets/assets/images/istanbul.jpeg": "27c87d99d14d20df27909c65b8acb2c3",
"assets/assets/images/harbin_metro.jpeg": "8374c800f58abdb1ef1122f6e7b47330",
"assets/assets/images/cairo_main.jpeg": "c4536f68e0423eb66f5a99f3fc6e8ca2",
"assets/assets/images/reykjavik_hallgrimskirkja.jpeg": "cd1ccbc2e96959d144c8d96300c2eed8",
"assets/assets/images/tokyo_sensoji.jpeg": "84349abc190aa3cafb8afb69c43f11db",
"assets/assets/images/hawaii_loco_moco.jpeg": "f29a36741c6eaa5508a708a004f4c7a4",
"assets/assets/images/dubai_hotel3.jpg": "1856788b658f4e3a32dfc1af373012a5",
"assets/assets/images/harbin_hot_pot.jpeg": "8c3c5a4752bf627f36410b4e94edc422",
"assets/assets/images/baklava.jpeg": "b216697cb5e22973d5e376db75740959",
"assets/assets/images/reykjavik_northern_lights.jpeg": "9f962d08433c973a612dca1e79de8eaa",
"assets/assets/images/grand_bazaar.jpeg": "38ac35f723c0bfd347b21db4897186df",
"assets/assets/images/escargot.jpeg": "2a6b37b9de94c253fb37c30b3444e21c",
"assets/assets/images/dubai_burj_khalifa.jpeg": "457c4afabc68db5d0ae7c626fe733c20",
"assets/assets/images/cairo_taameya.jpeg": "3236ccce09e3f8e7cd06ab1de79decdf",
"assets/assets/images/cheese.jpeg": "bfacfb532b8f7087fa1033306fad2b4c",
"assets/assets/images/reykjavik.jpeg": "68d1cc784d044fe8865969c500acf6f3",
"assets/assets/images/harbin_hotel2.jpeg": "b06bfedecf73b3704c9be46aec1e9fe6",
"assets/assets/images/istanbul_hotel2.jpeg": "262fd8a37bd8a03c40449d0afe160382",
"assets/assets/images/dubai_mall.jpeg": "098d44518759d32e354a07d5dc3d2bb9",
"assets/assets/images/cairo_hotel1.jpeg": "af95897ada0012bbc16bf7e317517e5e",
"assets/assets/images/basilica_cistern.jpeg": "7ea0d653c7c8df00cb6f125f76477a0a",
"assets/assets/images/topkapi.jpeg": "cf37f3b376592545448723d7db4b617a",
"assets/assets/images/dubai_palm.jpeg": "10e91cd58556cab020f00ed07c3c63ed",
"assets/assets/images/bali_nasi_goreng.jpeg": "db39bca52fcfe506729b838df934828c",
"assets/assets/images/cairo_spices.jpeg": "3a8e2fc3a2eb85b2c664f8e1ef7ba51d",
"assets/assets/images/newyork_empire_state.jpeg": "8e8e734ac2323579ee26dfedffb30fe2",
"assets/assets/images/harbin_dumplings.jpeg": "2877283136808687e6ce3b996182816b",
"assets/assets/images/bg2.jpeg": "266c210f1fa4fcbc1b9ce27c5b1a65c4",
"assets/assets/images/newyork_main.jpeg": "8a71a451e9717b376ad8fd34906bbd3d",
"assets/assets/images/harbin.jpeg": "2b87490e5cb463f1c43318a38e922a5a",
"assets/assets/images/page3bg.jpeg": "739eeda398a2f48bbad72ff2e4a78248",
"assets/assets/images/tokyo.jpeg": "008528af2abd3d5a49cb5d58cfb8e2f5",
"assets/assets/images/tokyo_anime_merch.jpeg": "7b1d0e0dde0bcb1c63800cb3a9d4f16c",
"assets/assets/images/tokyo_hotel1.jpeg": "385663b27379ca1960dab517e1cb2278",
"assets/assets/images/barcelona_montjuic.jpeg": "7e6faf1d07f03b60bcd494149c275eb1",
"assets/assets/images/bus.jpeg": "4588e5e3c5961eaeade589d26567279a",
"assets/assets/images/cairo_papyrus.jpeg": "df3aff6c1e00d54ced8ca4d00264d8aa",
"assets/assets/images/cairo_taxi.jpeg": "189a98bf1b438b50a8c9222e0f20065f",
"assets/assets/images/hawaii_pearl_harbor.jpeg": "9805a4ac1bb868a5f088d6bd37f76387",
"assets/assets/images/newyork_times_square.jpeg": "b1529054447f42137c204a6ed854e3ee",
"assets/assets/images/hawaii_kona_coffee.jpeg": "83a97a0c0a9eed7a4ed97b763118c6ad",
"assets/assets/images/newyork_hotel1.jpeg": "f60901994183304dfe24871c867cdf0b",
"assets/assets/images/barcelona_casa_batllo.jpeg": "16b807ef4cfbac7a80c5794095a20a87",
"assets/assets/images/dubai_perfume.jpeg": "25be94cabb33c6c01e9d24d4422edaf5",
"assets/assets/images/harbin_bus.jpeg": "1a7c6b07f548df253ccd3044c748c8a7",
"assets/assets/images/cairo_citadel.jpeg": "28f5265a0a887ef78fa9413a35a07f7c",
"assets/assets/images/coq_au_vin.jpeg": "67aca75565885beab54edaa4d3653de9",
"assets/assets/images/bg5.jpeg": "b6c7e5ebd43845b27dacad17e76e4f37",
"assets/assets/images/barcelona_park_guell.jpeg": "dfeed8f1f2c8130c76e7897494e45757",
"assets/assets/images/bali_babi_guling.jpeg": "62690a0d1535f9ab588aef9902e551e1",
"assets/assets/images/tokyo_electronics.jpeg": "19605ea2e00c4d4f1ee11b343bc8affc",
"assets/assets/images/lantern.jpeg": "f70ae6d783e5e7945b137d5f8acb04de",
"assets/assets/images/bali_seminyak.jpeg": "d3c09dcdd75ff21738955bdc92920ee2",
"assets/assets/images/newyork_bagel.jpeg": "d3ffa93336a9e95d3871936ad857e6dd",
"assets/assets/images/page3logo.png": "eea67749bb3df32df76953ffb325507e",
"assets/assets/images/dubai_machboos.jpeg": "ee2b69bf705725a3409db81c6d040ef5",
"assets/assets/images/hawaii_volcano.jpeg": "0647d65698a49d63df9ba16d207b9323",
"assets/assets/images/cairo_jewelry.jpeg": "a6ad476c7d469ef3bb734b171b757507",
"assets/assets/images/tokyo_sushi.jpeg": "1da19e14b0a7972cfbeba24d76ae1613",
"assets/assets/images/hotel1.jpeg": "0b53a97fee9503600a98639090016992",
"assets/assets/images/metro.jpeg": "e9403401d6ab38d48342f1a10a90d69b",
"assets/assets/images/newyork_taxi.jpeg": "368a1d93a2917e2b1bbe73c53fa9619e",
"assets/assets/images/bg4.jpeg": "34cbc3301b2de8323d15fa871a281ee4",
"assets/assets/images/barcelona_rambla.jpeg": "5602f137de7168a894bf5958ba19d208",
"assets/assets/images/barcelona_hotel1.jpeg": "91bbf7a851b61711f47b1c9c369da3cc",
"assets/assets/images/page2logo.png": "069c166e04559c60018426c4b8944d05",
"assets/assets/images/ceramic.jpeg": "5e56f39433c4afc28e3e4b1afa3254ae",
"assets/assets/images/bali_silver.jpeg": "3d9ef99a66e4115c405cdedc95d33b3e",
"assets/assets/images/barcelona_metro.jpeg": "62378546bf8363c9109abec7dcc170de",
"assets/assets/images/tokyo_main.jpeg": "9f6c6952e9b6bb75e6c06d5740018b4d",
"assets/assets/images/zermatt_hotel2.jpeg": "bef43880f97d816502029349f05041c8",
"assets/assets/images/hawaii_quilt.jpeg": "ab44d181cf602637f0dc47de7612b13b",
"assets/assets/images/harbin_main.jpeg": "0e15284b3297697e452d9f0fa8ce9953",
"assets/assets/images/bosphorus.jpeg": "11b72fec1e66d11950a3f1281440baee",
"assets/assets/images/dubai_falafel.jpg": "bdb79654067cc9bf620384267beba6c2",
"assets/assets/images/zermatt_electric_taxi.jpeg": "0e968d881af0b122f35a1808da5f504e",
"assets/assets/images/newyork_central_park.jpeg": "c8398eaada4656dae46ab84f3860f33e",
"assets/assets/images/bali_hotel1.jpeg": "adeabb3a79008b9dbbbc9cb55c13100f",
"assets/assets/images/spices.jpeg": "a86545bfef2577172879ebde876b38b7",
"assets/assets/images/dubai_hotel1.jpeg": "de0e4a3ad0b4181f040c34597e0e6008",
"assets/assets/images/hawaii_hotel1.jpeg": "8af63ab964f807c1dfcb0ceb5e9e6f01",
"assets/assets/images/hagia_sophia.jpeg": "bb87bd7924bf6b2fdc028d66f60a51ee",
"assets/assets/images/zermatt_hotel1.jpeg": "14c69d0e418d83399904e7fd41f80057",
"assets/assets/images/tokyo_meiji.jpeg": "5e35dce1bf5385296be53ec6f95f8205",
"assets/assets/images/newyork_statue_liberty.jpeg": "c938b01f39befef21437bcaabc315f0e",
"assets/assets/images/cairo_koshari.jpeg": "695aab6a8c27a4e2ad8b1cd77090d015",
"assets/assets/images/bali_satay.jpeg": "ef1d19bef168f747257dd6dc3b276152",
"assets/assets/images/zermatt_fondue.jpeg": "672608bd91f4b995089d5c26703b4cb1",
"assets/assets/images/hawaii_main.jpeg": "eab1e58f64bb3f62c11a0e6d0a8eca70",
"assets/assets/images/newyork_subway.jpeg": "7a4485882f4db7f46e9b903e4b0dbb24",
"assets/assets/images/bali_hotel2.jpeg": "1fb3c65b0b2e367c20c2d4f3bff91e74",
"assets/assets/images/fashion.jpeg": "3bf06cf4bc5297259447f958180835fc",
"assets/assets/images/dubai_hotel2.jpeg": "b4050709c9ac861649abccd4fe32e30b",
"assets/assets/images/hawaii_hotel2.jpeg": "4247fa653c16a92f8a798f4e045a75f8",
"assets/assets/images/tokyo_subway.jpeg": "6f948bc094f1d46012fe548dd812efc1",
"assets/assets/images/dubai_main.jpeg": "3ed9bdacdc7207df407aefa4ac6b2fad",
"assets/assets/images/reykjavik_harpa.jpeg": "813647bc6143633d8a3a5cb95b316f49",
"assets/assets/images/perfume.jpeg": "1ea8db57729e2715b0c7ec3c845679c8",
"assets/assets/images/eiffel_night.jpeg": "cc0cccdcce1582cf5aed0cae27d2a6c6",
"assets/assets/images/bali_tanah_lot.jpeg": "c6b6b520ea9210774c48a84d6dbbe2c0",
"assets/assets/images/bali_scooter.jpeg": "62b2ac81430033795db65375ef8e1d35",
"assets/assets/images/hawaii_haleakala.jpeg": "b3fe6a4f6248e255816b290090301793",
"assets/assets/images/zermatt_chocolate.jpeg": "79f5f792d43fa8b46ca03db144f0ba1e",
"assets/assets/images/zermatt_skiing.jpeg": "11374e5412c37644caa11f94c85b0dd3",
"assets/assets/images/cairo.jpeg": "c4536f68e0423eb66f5a99f3fc6e8ca2",
"assets/assets/images/hotel2.jpeg": "ff349c78c452006a6cb28d2fab1438a9",
"assets/assets/images/dubai.jpeg": "c765517fe2bc79b7394111db27b79f9c",
"assets/assets/images/seine.jpeg": "d8b3515e1819d0ccd7b58d39f428667c",
"assets/assets/images/barcelona_hotel2.jpeg": "5109b28f649d86380c72c330b9f963bd",
"assets/assets/images/cairo_metro.jpeg": "f0c5f515cff8a35bf08bba10e7126c49",
"assets/assets/images/Logo.png": "0fec75e79f4b981d7340249574ebcd95",
"assets/assets/images/bali_tegallalang.jpeg": "215ea04b1518eae770d90739028e265e",
"assets/assets/images/bike.jpeg": "6d9dba0335a777670136f43dcafaeb10",
"assets/assets/images/harbin_sun_island.jpeg": "e927858e290092d7ff3181bfb191dea9",
"assets/assets/images/page2bg.jpeg": "e6c8dd7e3707408e66c91bce361bd287",
"assets/assets/images/barcelona_hotel3.jpeg": "803c863e33cb6a5bb131121c551a9111",
"assets/assets/images/montmartre.jpeg": "2e41f4d1e97a49746487df48886d451c",
"assets/assets/images/bali.jpeg": "520116a0c504e1ec3b2eaf5b22f19b47",
"assets/assets/images/sacre_coeur.jpeg": "f9df5b15e847d95e02ff52233beb8887",
"assets/assets/images/tokyo_tower.jpeg": "b7886612cfb2be6149c3f8d022575c44",
"assets/assets/images/hotel3.jpeg": "701d4105f2699cbe9211214788739b87",
"assets/assets/images/barcelona.jpeg": "8b5130947b43dc353c3562a4e6bc42e1",
"assets/assets/images/blue_mosque.jpeg": "889355ba3e826a5f1412187920664a79",
"assets/assets/images/reykjavik_skyr.jpeg": "464c3484e2e0733d35c0b201da3ed47a",
"assets/assets/images/tokyo_hotel2.jpeg": "79b49facfe846a318cc6ddff940c7b1b",
"assets/assets/images/bali_taxi.jpeg": "504476787894e28de4694a04fc48e2bf",
"assets/assets/images/barcelona_gothic.jpeg": "c1d30798811c7ec66ddca8719e9429e5",
"assets/assets/images/reykjavik_bus.jpeg": "a536daf436ca7b31dd600b35672766d2",
"assets/assets/images/harbin_sophia_cathedral.jpeg": "d1c4fdd745a44e446fa9da63676d5eb5",
"assets/assets/images/reykjavik_main.jpeg": "f56f4b2bab5849e660a86068ca1bcbf2",
"assets/assets/images/barcelona_bike.jpeg": "4bc02aa8129f77b05902e5785671a6ae",
"assets/assets/images/louvre.jpeg": "b8dd34a9cb220055c4f65d11b152e0d5",
"assets/assets/images/bali_hotel3.jpeg": "13b0bf10fe62caafee507c19a0306423",
"assets/assets/images/dubai_desert.jpeg": "c34182ecd5824b5e33dbde8cb0a57e80",
"assets/assets/images/hawaii_waikiki.jpeg": "80dbd5aaff085c42af2ff6a08b7ed576",
"assets/assets/images/zermatt_matterhorn.jpeg": "63022cfbc3b2f43c97074007ecb0ab50",
"assets/assets/images/zermatt_main.jpeg": "4027b1ed8ec1d8232c50cca5e590901b",
"assets/assets/images/istanbul_ferry.jpeg": "b8da39a3b22ac58d3020dafd246e3645",
"assets/assets/images/newyork_hotel2.jpeg": "c66e1f8fa8d849924198d697185116c5",
"assets/assets/images/paris.jpeg": "dc00e33ac569d019e7a322080c082be8",
"assets/assets/images/zermatt_train.jpeg": "1532ad62af73af389d4b7de1379dfb1a",
"assets/assets/images/zermatt_raclette.jpeg": "9de9ce9100a94a87392f9d666a32f5a2",
"assets/assets/images/bali_uluwatu.jpeg": "8c1e91d19ae22ef84a0dc2e1059b4660",
"assets/assets/images/zermatt_swiss_watch.jpeg": "5e4882ebe685a5822f1dceb3c9af9a75",
"assets/assets/images/tokyo_ramen.jpeg": "ac9f6c0013f49e7440aaa173f4c11f33",
"assets/assets/images/wine.jpeg": "dbedea012c1b4711fc27388b8b6100a7",
"assets/assets/images/bg1.jpeg": "0bff7f2aa79f9faa27c8943f66307a12",
"assets/assets/images/newyork.jpeg": "212d05843bb11ab1f5a3121ef5a469e6",
"assets/assets/images/zermatt_gornergrat.jpeg": "a470f704a4c60b36671e3a06ef80d238",
"assets/assets/images/zermatt_glacier_paradise.jpeg": "e7dfb5a8abb5226b05ac5373550ac369",
"assets/assets/images/istanbul_main.jpeg": "cadce1f24fd85e241616bf41c26ffeb9",
"assets/assets/images/cairo_pyramids.jpeg": "0c6337d708b01b3ad065c668359c9291",
"assets/assets/images/newyork_souvenirs.jpeg": "2006b8583b161fa70d62fbb71a206370",
"assets/assets/images/cairo_museum.jpeg": "cf49d76fa5234586550e2d9ecb996e65",
"assets/assets/images/barcelona_ceramics.jpeg": "0b55e6b9211529af71ded53d0d8e7d7d",
"assets/assets/images/croissant.jpeg": "ee2e4ce944afe7daf5227bb11d3d31cc",
"assets/assets/images/dubai_taxi.jpeg": "94cb157cb7ee230a25461cf93e90a430",
"assets/assets/images/reykjavik_wool.jpeg": "bec9431100daac90adfe8a7b8d425043",
"assets/assets/images/kebab.jpeg": "09492a00a2d58afc8c72508236c5802d",
"assets/assets/images/dubai_gold.jpeg": "6b460efb2fe74e13a6bd29d6061b4e09",
"assets/assets/images/newyork_broadway_ticket.jpeg": "807d9fb46f07abfae2848c03a40b1a96",
"assets/assets/images/tokyo_shibuya.jpeg": "1bce9f83c6263a3c0e270f7cdd9cbe70",
"assets/assets/images/trot_bg.jpeg": "94ed81e26caa15a8e31eae8b52a2b6ec",
"assets/assets/images/barcelona_sagrada.jpeg": "8ca4a563c475c12bb20a111b10726e10",
"assets/assets/images/newyork_pizza.jpeg": "e09bb49b7cd372e92e22dc08a7828ad0",
"assets/assets/images/dubai_metro.jpeg": "226c9c363b8834f857b595ff5f84ffff",
"assets/assets/images/paris_main.jpeg": "11bad210a7770dbc8843f88e0f71d417",
"assets/assets/images/harbin_hotel1.jpeg": "cf8f7e53e9f384c326508b2589df3767",
"assets/assets/images/barcelona_wine.jpeg": "dbedea012c1b4711fc27388b8b6100a7",
"assets/assets/images/istanbul_hotel1.jpeg": "349dcc397d90995d682c83ff0224b9bd",
"assets/assets/images/bali_batik.jpeg": "af5c8ba2c45b3a1bfa1d00c7fda6aa7e",
"assets/assets/images/cairo_hotel2.jpeg": "e3401a8343f6b7c073cee9ce6ae03171",
"assets/assets/images/istanbul_tram.jpeg": "dd7f2754705b0af3c8adb83a4813835b",
"assets/assets/images/bali_gotel1.jpeg": "adeabb3a79008b9dbbbc9cb55c13100f",
"assets/assets/images/cairo_hotel3.jpeg": "fcd83b66052ff6735ba3701161c54300",
"assets/assets/images/reykjavik_hotel2.jpeg": "51f3d95c53647d44f8a41b0704b183e5",
"assets/assets/images/eiffel.jpeg": "d8f2dc35626296564f3297168dcfcac6",
"assets/assets/images/barcelona_leather.jpeg": "7c135d597045e3aa53976355042161f9",
"assets/assets/images/hawaii_bus.jpeg": "48574629d8a07ca3c7f455a51535c3ae",
"assets/assets/images/reykjavik_taxi.jpeg": "b53c2bd86386c5425e8bfd3def9deecf",
"assets/assets/images/barcelona_tapas.jpeg": "abe195e2a3f93a17cb272ce3c21fc731",
"assets/assets/images/reykjavik_seafood.jpeg": "8b6bc1cf6f6f69d8c12a3ab7034232e5",
"assets/assets/images/bali_main.jpeg": "8eda9d0739b9cd5aec097d1037e0efe1",
"assets/assets/images/barcelona_bus.jpeg": "0e29f0cabcfa63f2e48b8b90a9a4fd06",
"assets/assets/images/dubai_dates.jpeg": "7db61ace417337a84def5edb52eb2331",
"assets/assets/images/tokyo_train.jpeg": "bfed10bf089ac059413f5bcb87770137",
"assets/assets/images/barcelona_churros.jpeg": "1f13765667abf5ddd296c0bddfe608c4",
"assets/assets/images/simit.jpeg": "13097293232f2056e399ac03e1262cd3",
"assets/assets/images/barcelona_paella.jpeg": "c5b4b5d34e05f307678b083e2932f824",
"assets/assets/images/hawaii_poke.jpeg": "abb61dcfabfb38c246959f5ee00c6c8a",
"assets/assets/images/cairo_bazaar.jpeg": "863508852167d0e017cbe95dc219d51f",
"assets/assets/images/hawaii_car_rental.jpeg": "ee61cc69ee68b1ad080a25f916e1b1bb",
"assets/assets/images/harbin_tiger_park.jpeg": "167b425647a79732f25b1943b9311476",
"assets/assets/images/hawaii_hanauma.jpeg": "1917b9a04442118301c005aa52a83ab2",
"assets/assets/images/bali_ubud_monkey.jpeg": "e3a1eecab41c9eb4ccbf1d7d0fd621c8",
"assets/assets/fonts/PermanentMarker-Regular.ttf": "c863f8028c2505f92540e0ba7c379002",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

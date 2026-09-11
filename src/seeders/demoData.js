import { query, queryOne, transaction } from '../config/database.js'

const demoProducts = [
  {
    name: 'AirPods Pro 2da Generación',
    slug: 'airpods-pro-2',
    sku: 'AUD-APP-001',
    categoryId: 1,
    brandId: 1,
    shortDescription: 'Auriculares inalámbricos con cancelación de ruido activa y audio espacial',
    description: '<p>Los <strong>AirPods Pro 2</strong> ofrecen cancelación de ruido activa de última generación, audio espacial personalizado y una autonomía de hasta 30 horas con el estuche de carga.</p><h3>Características principales</h3><ul><li>Chip H2 para un rendimiento superior</li><li>Cancelación de ruido activa 2x más efectiva</li><li>Audio espacial con seguimiento dinámico de la cabeza</li><li>Modo transparencia adaptativa</li><li>Resistencia al sudor y agua IPX4</li></ul>',
    specifications: { 'Driver': 'Driver de alta excursión diseñado por Apple', 'Chip': 'H2', 'Bluetooth': '5.3', 'Autonomía': 'Hasta 6 horas (30h con estuche)', 'Carga': 'Lightning, MagSafe, Qi', 'Resistencia': 'IPX4' },
    features: ['Cancelación de ruido activa', 'Audio espacial', 'Modo transparencia', 'Resistencia IPX4', 'Ecualización adaptativa', 'Detección de conversación'],
    warranty: '12 meses de garantía oficial Apple',
    price: 89900,
    originalPrice: 119900,
    stock: 15,
    minStock: 3,
    isFeatured: true,
    isNew: false,
    isOnSale: true,
  },
  {
    name: 'iPhone 15 Pro Max 256GB',
    slug: 'iphone-15-pro-max-256gb',
    sku: 'SPH-APP-002',
    categoryId: 2,
    brandId: 1,
    shortDescription: 'Smartphone flagship con chip A17 Pro, cámara principal de 48MP y titanio',
    description: '<p>El <strong>iPhone 15 Pro Max</strong> redefine lo que un smartphone puede hacer. Con el chip A17 Pro, sistema de cámaras profesional y diseño en titanio de grado aeroespacial.</p><h3>Especificaciones destacadas</h3><ul><li>Pantalla Super Retina XDR de 6.7"</li><li>Chip A17 Pro con GPU de 6 núcleos</li><li>Sistema de cámaras Pro: 48MP + 12MP + 12MP</li><li>Zoom óptico 5x</li><li>USB-C con USB 3</li></ul>',
    specifications: { 'Pantalla': '6.7" Super Retina XDR', 'Chip': 'A17 Pro', 'Almacenamiento': '256GB', 'Cámara principal': '48MP', 'Cámara ultra gran angular': '12MP', 'Teleobjetivo': '12MP 5x', 'Batería': 'Hasta 29h reproducción video', 'Material': 'Titanio', 'Colores': 'Titanio natural, azul, blanco, negro' },
    features: ['Dynamic Island', 'Always-On Display', 'Face ID', 'Resistencia IP68', 'Apple Pay', 'Dual SIM (nano + eSIM)', '5G', 'Wi-Fi 6E'],
    warranty: '12 meses de garantía oficial Apple',
    price: 1299900,
    originalPrice: 1449900,
    stock: 8,
    minStock: 2,
    isFeatured: true,
    isNew: true,
    isOnSale: true,
  },
  {
    name: 'MacBook Air M2 13.6" 8GB/256GB',
    slug: 'macbook-air-m2-13-8gb-256gb',
    sku: 'CMP-APP-003',
    categoryId: 3,
    brandId: 1,
    shortDescription: 'Laptop ultraportátil con chip M2, pantalla Liquid Retina y 18h de batería',
    description: '<p>La <strong>MacBook Air con chip M2</strong> combina rendimiento increíble con una portabilidad extrema. Diseñada para volar en cualquier tarea.</p><h3>Por qué te encantará</h3><ul><li>Chip M2: CPU 8 núcleos, GPU 10 núcleos</li><li>Pantalla Liquid Retina de 13.6" con 500 nits</li><li>Hasta 18 horas de autonomía</li><li>Diseño silencioso sin ventilador</li><li>Cámara 1080p FaceTime HD</li></ul>',
    specifications: { 'Chip': 'Apple M2 (CPU 8 núcleos, GPU 10 núcleos)', 'Memoria': '8GB unificada', 'Almacenamiento': '256GB SSD', 'Pantalla': '13.6" Liquid Retina (2560x1664)', 'Cámara': '1080p FaceTime HD', 'Audio': 'Sistema de 4 altavoces, Spatial Audio', 'Puertos': '2x Thunderbolt/USB 4, MagSafe 3, jack 3.5mm', 'Batería': '52.6Wh, hasta 18h', 'Cargador': '30W USB-C (incluido 35W dual)', 'Dimensiones': '1.13 x 30.41 x 21.5 cm', 'Peso': '1.24 kg' },
    features: ['Chip M2', 'Pantalla Liquid Retina', '18h batería', 'Sin ventilador', 'Touch ID', 'Magic Keyboard', 'Force Touch trackpad'],
    warranty: '12 meses de garantía oficial Apple',
    price: 999900,
    originalPrice: 1149900,
    stock: 5,
    minStock: 2,
    isFeatured: true,
    isNew: false,
    isOnSale: true,
  },
  {
    name: 'Sony WH-1000XM5',
    slug: 'sony-wh-1000xm5',
    sku: 'AUD-SNY-004',
    categoryId: 1,
    brandId: 3,
    shortDescription: 'Auriculares over-ear con la mejor cancelación de ruido del mercado',
    description: '<p>Los <strong>Sony WH-1000XM5</strong> son la referencia en cancelación de ruido. Con procesador V1 integrado y 8 micrófonos, silencian el mundo como ningún otro.</p>',
    specifications: { 'Driver': '30mm', 'Cancelación de ruido': 'Procesador V1 + QN1', 'Bluetooth': '5.2 (LDAC, AAC, SBC)', 'Autonomía': '30h (ANC on), 40h (ANC off)', 'Carga rápida': '3 min = 3h', 'Peso': '250g', 'App': 'Sony Headphones Connect' },
    features: ['Mejor ANC del mercado', '30h autonomía', 'Carga rápida', 'Speak-to-Chat', 'Multipunto', 'Detección de uso'],
    warranty: '12 meses de garantía oficial Sony',
    price: 349900,
    originalPrice: 429900,
    stock: 22,
    minStock: 5,
    isFeatured: true,
    isNew: false,
    isOnSale: true,
  },
  {
    name: 'Samsung Galaxy S24 Ultra 512GB',
    slug: 'samsung-galaxy-s24-ultra-512gb',
    sku: 'SPH-SAM-005',
    categoryId: 2,
    brandId: 2,
    shortDescription: 'El smartphone Android definitivo con S Pen, 200MP y Galaxy AI',
    description: '<p>El <strong>Galaxy S24 Ultra</strong> incorpora Galaxy AI para transformar tu experiencia móvil. Con titanio, 200MP y el S Pen integrado.</p>',
    specifications: { 'Pantalla': '6.8" Dynamic AMOLED 2X 120Hz', 'Chip': 'Snapdragon 8 Gen 3 for Galaxy', 'Almacenamiento': '512GB', 'RAM': '12GB', 'Cámara principal': '200MP', 'Ultra gran angular': '12MP', 'Teleobjetivo 3x': '10MP', 'Teleobjetivo 10x': '10MP', 'Batería': '5000mAh', 'Carga': '45W cableado, 15W inalámbrica', 'S Pen': 'Integrado con Bluetooth', 'Material': 'Titanio' },
    features: ['Galaxy AI', 'Circle to Search', 'Live Translate', 'Generative Edit', '200MP', 'S Pen', '100x Space Zoom', 'IP68', '7 años actualizaciones'],
    warranty: '12 meses de garantía oficial Samsung',
    price: 1199900,
    originalPrice: 1349900,
    stock: 12,
    minStock: 3,
    isFeatured: true,
    isNew: true,
    isOnSale: true,
  },
  {
    name: 'Logitech G Pro X Superlight 2',
    slug: 'logitech-g-pro-x-superlight-2',
    sku: 'GAM-LOG-006',
    categoryId: 4,
    brandId: 4,
    shortDescription: 'Mouse gaming inalámbrico ultraligero de 60g con sensor HERO 2',
    description: '<p>El <strong>G Pro X Superlight 2</strong> es el mouse elección de los profesionales. 60g, sensor HERO 2 de 32,000 DPI y 95h de batería.</p>',
    specifications: { 'Sensor': 'HERO 2', 'DPI': '100-32,000', 'Peso': '60g', 'Conectividad': 'LIGHTSPEED inalámbrico', 'Botones': '5 programables', 'Batería': 'Hasta 95h', 'Switches': 'LIGHTFORCE híbridos', 'Compatibilidad': 'Windows, macOS, Linux' },
    features: ['60g ultraligero', 'HERO 2 sensor', '95h batería', 'LIGHTSPEED', 'Switches híbridos', 'PTFE feet'],
    warranty: '24 meses de garantía oficial Logitech',
    price: 159900,
    originalPrice: 189900,
    stock: 30,
    minStock: 5,
    isFeatured: true,
    isNew: false,
    isOnSale: true,
  },
  {
    name: 'Apple Watch Series 9 45mm',
    slug: 'apple-watch-series-9-45mm',
    sku: 'SWT-APP-007',
    categoryId: 5,
    brandId: 1,
    shortDescription: 'Smartwatch con chip S9, gesto de doble toque y 36h de batería',
    description: '<p>El <strong>Apple Watch Series 9</strong> trae el potente chip S9, nuevo gesto de doble toque y pantalla más brillante.</p>',
    specifications: { 'Caja': '45mm aluminio', 'Pantalla': 'Always-On Retina LTPO 2000 nits', 'Chip': 'S9 SiP', 'Sensores': 'HR, ECG, SpO2, temperatura, acelerómetro, giroscopio', 'Batería': 'Hasta 36h (normal), 60h (ahorro)', 'Resistencia': '50m / IP6X', 'Conectividad': 'GPS + Cellular opcional, Wi-Fi, Bluetooth 5.3', 'watchOS': '10' },
    features: ['Chip S9', 'Doble toque', '2000 nits', '36h batería', 'watchOS 10', 'Detección de caídas', 'Emergencia SOS'],
    warranty: '12 meses de garantía oficial Apple',
    price: 449900,
    originalPrice: 499900,
    stock: 18,
    minStock: 3,
    isFeatured: true,
    isNew: true,
    isOnSale: true,
  },
  {
    name: 'Samsung 49" Odyssey G9',
    slug: 'samsung-49-odyssey-g9',
    sku: 'GAM-SAM-008',
    categoryId: 4,
    brandId: 2,
    shortDescription: 'Monitor gaming curvo 1000R DQHD 240Hz 1ms',
    description: '<p>El <strong>Odyssey G9</strong> es la inmersión total. 49" DQHD (5120x1440), 1000R, 240Hz, 1ms, G-Sync compatible.</p>',
    specifications: { 'Tamaño': '49"', 'Curvatura': '1000R', 'Resolución': 'DQHD 5120x1440 (32:9)', 'Panel': 'VA Quantum Mini-LED', 'Refresco': '240Hz', 'Tiempo de respuesta': '1ms (GtG)', 'HDR': 'HDR 1000', 'Brillo': '420 nits (típico), 1000 nits (pico)', 'Puertos': 'HDMI 2.1 x2, DP 1.4 x1, USB 3.0', 'Soporte': 'Altura, giro, inclinación, VESA 100x100' },
    features: ['49" DQHD', '1000R', '240Hz', '1ms', 'HDR1000', 'G-Sync/FreeSync', 'CoreSync lighting', 'PIP/PBP'],
    warranty: '36 meses de garantía oficial Samsung',
    price: 1299900,
    originalPrice: 1599900,
    stock: 6,
    minStock: 2,
    isFeatured: true,
    isNew: false,
    isOnSale: true,
  },
]

async function seedDemoData() {
  try {
    console.log('🌱 Seeding demo products...')

    for (const product of demoProducts) {
      const existing = await queryOne('SELECT id FROM products WHERE sku = ?', [product.sku])
      if (existing) {
        console.log(`⚠️  Product ${product.sku} already exists, skipping`)
        continue
      }

      const discount = product.originalPrice && product.price < product.originalPrice
        ? Math.round(((product.originalPrice - product.price) / product.originalPrice) * 100)
        : 0

      const result = await transaction(async (conn) => {
        const [productResult] = await conn.execute(
          `INSERT INTO products (
            category_id, brand_id, name, slug, sku, short_description, description,
            specifications, features, warranty, price, original_price, discount_percent,
            stock, min_stock, is_active, is_featured, is_new, is_on_sale
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, TRUE, ?, ?, ?)`,
          [
            product.categoryId, product.brandId, product.name, product.slug, product.sku,
            product.shortDescription, product.description,
            JSON.stringify(product.specifications || {}),
            JSON.stringify(product.features || []),
            product.warranty, product.price, product.originalPrice || null, discount,
            product.stock, product.minStock || 5,
            product.isFeatured || false, product.isNew || false, product.isOnSale || false
          ]
        )
        return productResult.insertId
      })

      console.log(`✅ Created product: ${product.name} (ID: ${result})`)
    }

    console.log('✅ Demo data seeded successfully')
  } catch (error) {
    console.error('❌ Error seeding demo data:', error.message)
    throw error
  }
}

seedDemoData().then(() => process.exit(0)).catch(() => process.exit(1))
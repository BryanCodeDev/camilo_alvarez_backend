const demoProducts = [
  {
    name: 'Cables y Cargadores para Celulares',
    slug: 'cables-cargadores-celulares',
    sku: 'ACC-CAB-001',
    categoryId: 6,
    brandId: 1,
    shortDescription: 'Kit completo de cables y cargadores universales para celulares',
    description: '<p>Kit completo de cables y cargadores universales para celulares. Compatible con USB-C, Lightning y Micro USB.</p>',
    specifications: { 'Conectores': 'USB-C, Lightning, Micro USB', 'Longitud': '1m / 2m', 'Material': 'Nylon trenzado' },
    features: ['Universal', 'Carga rápida', 'Durable', 'Multiple conectores'],
    warranty: '12 meses',
    price: 15900,
    originalPrice: 24900,
    stock: 50,
    minStock: 3,
    isFeatured: true,
    isNew: false,
    isOnSale: true,
  },
  {
    name: 'Audífonos',
    slug: 'audifonos',
    sku: 'AUD-AUD-002',
    categoryId: 1,
    brandId: 1,
    shortDescription: 'Audífonos over-ear con sonido envolvente y micrófono integrado',
    description: '<p>Audífonos over-ear con sonido envolvente y micrófono integrado. Ideales para gaming y llamadas.</p>',
    specifications: { 'Driver': '40mm', 'Bluetooth': '5.2', 'Autonomía': '20 horas', 'Peso': '260g' },
    features: ['Sonido envolvente', 'Micrófono', 'Comodidad', 'Plegables'],
    warranty: '12 meses',
    price: 29900,
    originalPrice: 45900,
    stock: 35,
    minStock: 3,
    isFeatured: true,
    isNew: true,
    isOnSale: true,
  },
  {
    name: 'Cargadores Vehiculares',
    slug: 'cargadores-vehiculares',
    sku: 'ACC-VEH-003',
    categoryId: 7,
    brandId: 10,
    shortDescription: 'Cargador dual para auto con puerto USB-C y USB-A',
    description: '<p>Cargador dual para auto con puerto USB-C y USB-A. Carga rápida para tus dispositivos en viaje.</p>',
    specifications: { 'Puertos': 'USB-C + USB-A', 'Potencia': '36W', 'Entrada': '12-24V DC' },
    features: ['Dual USB', 'Carga rápida', 'Compacto', 'Protección integral'],
    warranty: '12 meses',
    price: 8900,
    originalPrice: 12900,
    stock: 60,
    minStock: 3,
    isFeatured: true,
    isNew: false,
    isOnSale: true,
  },
  {
    name: 'Cargadores Portátiles',
    slug: 'cargadores-portatiles',
    sku: 'ACC-POR-004',
    categoryId: 7,
    brandId: 10,
    shortDescription: 'Power bank de 20000mAh con carga rápida y doble puerto USB',
    description: '<p>Power bank de 20000mAh con carga rápida y doble puerto USB. Perfecto para el día a día.</p>',
    specifications: { 'Capacidad': '20000mAh', 'Puertos': 'USB-C y USB-A', 'Potencia': '22.5W' },
    features: ['Carga rápida', 'Alta capacidad', 'Doble salida', 'Protección integral'],
    warranty: '12 meses',
    price: 12900,
    originalPrice: 19900,
    stock: 40,
    minStock: 5,
    isFeatured: true,
    isNew: false,
    isOnSale: true,
  },
  {
    name: 'Soportes Para Celulares',
    slug: 'soportes-celulares',
    sku: 'ACC-SOP-005',
    categoryId: 6,
    brandId: 10,
    shortDescription: 'Soporte universal para celulares con ajuste 360°',
    description: '<p>Soporte universal para celulares con ajuste 360°. Compatible con todos los tamaños.</p>',
    specifications: { 'Compatibilidad': 'Universal', 'Ajuste': '360° rotación', 'Material': 'Aluminio + silicona' },
    features: ['360°', 'Universal', 'Anti-deslizante', 'Ajustable'],
    warranty: '12 meses',
    price: 6900,
    originalPrice: 9900,
    stock: 70,
    minStock: 3,
    isFeatured: true,
    isNew: false,
    isOnSale: true,
  },
  {
    name: 'Adaptadores',
    slug: 'adaptadores',
    sku: 'ACC-ADA-006',
    categoryId: 6,
    brandId: 10,
    shortDescription: 'Pack de adaptadores universales: HDMI, VGA, USB-C y Ethernet',
    description: '<p>Pack de adaptadores universales: HDMI, VGA, USB-C y Ethernet. Conectividad total.</p>',
    specifications: { 'Tipos': 'HDMI, VGA, USB-C, Ethernet', 'HDMI': '4K@30Hz', 'Ethernet': 'Gigabit' },
    features: ['Multifuncional', '4K HDMI', 'Gigabit LAN', 'Compacto'],
    warranty: '12 meses',
    price: 4900,
    originalPrice: 7900,
    stock: 80,
    minStock: 3,
    isFeatured: true,
    isNew: true,
    isOnSale: true,
  },
  {
    name: 'Estuches Para Audífonos',
    slug: 'estuches-audifonos',
    sku: 'ACC-EST-007',
    categoryId: 6,
    brandId: 1,
    shortDescription: 'Estuche protector para audífonos con interior acolchado',
    description: '<p>Estuche protector para audífonos con interior acolchado. Transporte seguro.</p>',
    specifications: { 'Interior': 'Acolchado', 'Cierre': 'Cremallera', 'Material': 'Poliéster' },
    features: ['Protección', 'Portátil', 'Acolchado', 'Cierre seguro'],
    warranty: '12 meses',
    price: 3900,
    originalPrice: 5900,
    stock: 100,
    minStock: 3,
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
            cost_price, stock, min_stock, is_active, is_featured, is_new, is_on_sale
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, TRUE, ?, ?, ?)`,
          [
            product.categoryId, product.brandId, product.name, product.slug, product.sku,
            product.shortDescription, product.description,
            JSON.stringify(product.specifications || {}),
            JSON.stringify(product.features || []),
            product.warranty, product.price, product.originalPrice || null, discount,
            product.price, product.stock, product.minStock || 5,
            product.isFeatured || false, product.isNew || false, product.isOnSale || false
          ]
        )
        return productResult.insertId
      })

      await query('INSERT INTO product_images (product_id, url, alt_text, is_main, sort_order) VALUES (?, ?, ?, TRUE, 0)', [
        result, '/images/producto1.webp', product.name
      ])

      console.log(`✅ Created product: ${product.name} (ID: ${result})`)
    }

    console.log('✅ Demo data seeded successfully')
  } catch (error) {
    console.error('❌ Error seeding demo data:', error.message)
    throw error
  }
}

seedDemoData().then(() => process.exit(0)).catch(() => process.exit(1))

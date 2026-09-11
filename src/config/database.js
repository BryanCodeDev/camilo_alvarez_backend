import mysql from 'mysql2/promise'
import 'dotenv/config'

const pool = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 3306,
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'techstore',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  enableKeepAlive: true,
  keepAliveInitialDelay: 0,
  charset: 'utf8mb4',
})

export async function connectDB() {
  try {
    const connection = await pool.getConnection()
    console.log('✅ MySQL connected successfully')
    connection.release()
    return pool
  } catch (error) {
    console.error('❌ MySQL connection failed:', error.message)
    throw error
  }
}

export async function query(sql, params) {
  try {
    const [rows] = await pool.execute(sql, params)
    return rows
  } catch (error) {
    console.error('Query error:', error)
    throw error
  }
}

export async function queryOne(sql, params) {
  const rows = await query(sql, params)
  return rows[0] || null
}

export async function transaction(callback) {
  const connection = await pool.getConnection()
  try {
    await connection.beginTransaction()
    const result = await callback(connection)
    await connection.commit()
    return result
  } catch (error) {
    await connection.rollback()
    throw error
  } finally {
    connection.release()
  }
}

export default pool
// npm init
// npm i express
// npm i mysql2
// npm i bcrypt
// node index.js -> executa a API
// ​http://localhost:3000/cliente
const express = require("express")
const app = express()
const port = 3000
app.use(express.json())

const db = require("./db")

const bcrypt = require("bcrypt")
app.post("/Cliente", async (req, res) => {
    try {
        const Cliente = req.body
        const senhaCript = bcrypt.hashSync(Cliente.senha, 10)
        Cliente.Senha = senhaCript

       
        const resultado = await db.pool.query(
            `INSERT INTO cliente (
              Nome, CPF, Email, Senha, Celular
            ) VALUES ( ?, ?, ?, ?, ? )`,
            [Cliente.Nome, Cliente.CPF,
             Cliente.Email, Cliente.Senha, Cliente.Celular]
        )
        res.status(201).json({
            mensagem: "Cliente cadastrado, ID = " + resultado[0].insertId
        })
    } catch (error) {
        res.status(500).json({erro: error.message})
    }
})


app.get("/Cliente", async (req, res) => {
     try{
        const resultado = await db.pool.query(
            `SELECT Nome, CPF, Email, Celular FROM Cliente`
        )
        res.status(200).json(resultado[0])
    } catch(error){
        res.status(500).json({resposta: error.message})
    }  
})


app.get("/Cliente/:id", async (req, res) => {
    try {
        const { id } = req.params

        const resultado = await db.pool.query(
            `SELECT id, nome, cpf, email, celular FROM cliente WHERE id = ?`,
            [id]
        )

        if (resultado[0].length === 0) {
            return res.status(404).json({ mensagem: "Cliente não encontrado" })
        }

        res.status(200).json(resultado[0][0])
    } catch (error) {
        res.status(500).json({ erro: error.message })
    }
})


app.put("/Cliente/:id", async (req, res) => {
    try {
        const { id } = req.params
        const Cliente = req.body

        const existente = await db.pool.query(
            `SELECT id FROM Cliente WHERE id = ?`,
            [id]
        )

        if (existente[0].length === 0) {
            return res.status(404).json({ mensagem: "Cliente não encontrado" })
        }

        let Senha = Cliente.Senha
        if (Senha) {
            Senha = bcrypt.hashSync(Senha, 10)
        }

        await db.pool.query(
            `UPDATE cliente SET
                Nome = ?,
                CPF = ?,
                Email = ?,
                Senha = COALESCE(?, Senha),
                Celular = ?
             WHERE id = ?`,
            [
                Cliente.Nome,
                Cliente.CPF,
                Cliente.Email,
                Senha || null,
                Cliente.celular,
                id
            ]
        )

        res.status(200).json({ mensagem: "Cliente atualizado" })
    } catch (error) {
        res.status(500).json({ erro: error.message })
    }
})


app.delete("/Cliente/:id", async (req, res) => {
    try {
        const { id } = req.params

        const resultado = await db.pool.query(
            `DELETE FROM cliente WHERE id = ?`,
            [id]
        )

        if (resultado[0].affectedRows === 0) {
            return res.status(404).json({ mensagem: "Cliente não encontrado" })
        }

        res.status(200).json({ mensagem: "Cliente removido" })
    } catch (error) {
        res.status(500).json({ erro: error.message })
    }
})


app.listen(port, () => {
    console.log("API rodando na porta " + port)
})

app.post("/login", async (req,res) => {
    try{
        const user = req.body
        const resultado = await db.pool.query()
    }
})
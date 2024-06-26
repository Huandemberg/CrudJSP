package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Produto {

    //Atributos
    private String nome;
    private String marca;
    private double preco;

    //Métodos especiais
    public Produto(String nome, String marca, double preco) {
        this.nome = nome;
        this.marca = marca;
        this.preco = preco;
    }

    public Produto() {

    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    //Métodos
    public Connection cxBanco() throws ClassNotFoundException, SQLException {
        //Configurar a conexão com banco de dados
        Connection conect;
        conect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdcrud", "root", "root");
        return conect;
    }

    public void salvarProduto(String forn) throws SQLException, ClassNotFoundException {
        //Fazer a conexão com o BD
        Connection conect;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conect = cxBanco();
        //Inserir os dados na tabela produto do BD aberto
        st = conect.prepareStatement("INSERT INTO produto (nome, marca, nome_fornecedor , preco) VALUES (?, ?, ?, ?)");
        st.setString(1, this.nome);
        st.setString(2, this.marca);
        st.setString(3, forn);
        st.setDouble(4, this.preco);
        st.executeUpdate(); //Executa o comando INSERT
    }

    public void updateProduto(String n, String m, double p, int codigo) throws SQLException, ClassNotFoundException {
        //Fazer a conexão com o BD
        Connection conect;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conect = cxBanco();
        //Alterar os dados na tabela
        st = conect.prepareStatement("UPDATE produto SET nome=?, marca=?, preco=? WHERE codigo = ? ");
        st.setString(1, n);
        st.setString(2, m);
        st.setDouble(3, p);
        st.setInt(4, codigo);
        st.executeUpdate();
    }

    public void excluirProduto(int cod) throws ClassNotFoundException, SQLException {
        //Fazer a conexão com o BD
        Connection conect;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conect = cxBanco();
        //Excluir o produto da tabela
        st = conect.prepareStatement("DELETE FROM produto WHERE codigo=?");
        st.setInt(1, cod);
        st.executeUpdate(); //Executa o comando SQL escrito no codigo

    }

    public ResultSet listar() throws ClassNotFoundException, SQLException {
        //Fazer a conexão com o BD
        Connection conect;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conect = cxBanco();
        //Realizar a consulta com o BD
        st = conect.prepareStatement("SELECT * FROM produto");
        ResultSet rs = st.executeQuery();
        return rs;

    }

    public ResultSet listarId(int n) throws ClassNotFoundException, SQLException {
        //Fazer a conexão com o BD
        Connection conect;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conect = cxBanco();
        //Realizar a consulta com o BD
        st = conect.prepareStatement("SELECT * FROM produto WHERE codigo LIKE ?");
        st.setInt(1, n);
        ResultSet rs = st.executeQuery();
        return rs;

    }

    public ResultSet listarNome(String n) throws ClassNotFoundException, SQLException {
        //Fazer a conexão com o BD
        Connection conect;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conect = cxBanco();
        //Realizar a consulta com o BD
        st = conect.prepareStatement("SELECT * FROM produto WHERE nome LIKE ?");
        st.setString(1, "%" + n + "%");
        ResultSet rs = st.executeQuery();
        return rs;

    }

    public ResultSet listarPreco(double n) throws ClassNotFoundException, SQLException {

        Connection conect;
        PreparedStatement st;
        //Fazer a conexão com o BD
        Class.forName("com.mysql.cj.jdbc.Driver");
        conect = cxBanco();
        //Realizar a consulta com o BD
        st = conect.prepareStatement("SELECT * FROM produto WHERE CAST(preco AS DECIMAL(10,1)) = ?");
        st.setDouble(1, n);
        ResultSet rs = st.executeQuery();
        return rs;

    }

}

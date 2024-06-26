
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Fornecedor {
    
    //Atributos
    private String nome;
    

    //Métodos especiais
    
    
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    

    public Fornecedor(String nome) {
        this.nome = nome;
    }
    
    //Métodos
    public Connection cxBanco() throws ClassNotFoundException, SQLException {
        //Configurar a conexão com banco de dados
        Connection conect;
        conect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdcrud", "root", "root");
        return conect;
    }
    
    public void cadForn() throws ClassNotFoundException, SQLException{
        //Fazer a conexão com o BD
        Connection conect;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conect = cxBanco();
        //Inserir os dados na tabela produto do BD aberto
        st = conect.prepareStatement("INSERT INTO fornecedor (nome) VALUES (?)");
        st.setString(1, this.nome);
        st.executeUpdate(); //Executa o comando INSERT
    }
    
}

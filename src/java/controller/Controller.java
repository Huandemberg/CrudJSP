package controller;


import java.sql.ResultSet;
import java.sql.SQLException;
import model.Produto;
import model.Fornecedor;

public class Controller {
    
    public void save(String nome, String marca, double preco, String forn) throws SQLException, ClassNotFoundException{
        Produto pn = new Produto(nome, marca, preco);
        Fornecedor fn = new Fornecedor(forn);
        try{
        fn.cadForn();    
        pn.salvarProduto(forn);
        }catch (Exception x){
            pn.salvarProduto(forn);
        }
        
        
    }
    
    public void excluir(int cod) throws SQLException, ClassNotFoundException{
        Produto pn = new Produto();
        pn.excluirProduto(cod);
        
    }
    
    public ResultSet list() throws SQLException, ClassNotFoundException{
        Produto pn = new Produto();
        ResultSet rs = pn.listar();
        return rs;
    }
    
    public ResultSet listId(int n) throws SQLException, ClassNotFoundException{
        Produto pn = new Produto();
        ResultSet rs = pn.listarId(n);
        return rs;
    }
    public ResultSet listNome(String n) throws SQLException, ClassNotFoundException{
        Produto pn = new Produto();
        ResultSet rs = pn.listarNome(n);
        return rs;
    }
    
    public ResultSet listPreco(double n) throws SQLException, ClassNotFoundException{
        Produto pn = new Produto();
        ResultSet rs = pn.listarPreco(n);
        return rs;
    }
    
    public void update (String n, String m, double p, int cod) throws SQLException, ClassNotFoundException {
        Produto pn = new Produto();
        pn.updateProduto(n, m, p, cod);
    }
}

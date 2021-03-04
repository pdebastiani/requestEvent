/**
 *
 * @author Paulo Sergio Debastiani - fev/21
 */
package Model;

import Utils.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Cafe {
    
    private int id;
    private String cafe;
    private int lotacao;
    
    public boolean salvar() {
        Connection con = Conexao.conectar();
        String sql = "insert into cafe(cafe, lotacao) "
                + "values(?, ?);";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cafe);
            stm.setInt(2, this.lotacao);
            stm.execute(); 
        } catch (SQLException ex) {
            Logger.getLogger(Cafe.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public boolean alterar() {
        Connection con = Conexao.conectar();
        String sql = "update cafe set "
                + "cafe = ? ,"
                + "lotacao = ? "
                + "where id = ?;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cafe);
            stm.setInt(2, this.lotacao);
            stm.setInt(3, this.id);
            stm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Cafe.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "delete from cafe "
                + "where id = ?;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Cafe.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public Cafe consultar(int pId) {
        Connection con = Conexao.conectar();
        String sql = "select * from cafe "
                + "where id = ?;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                this.setId(rs.getInt("id"));
                this.setCafe(rs.getString("cafe"));
                this.setLotacao(rs.getInt("lotacao"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Cafe.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this;
    }
    
    public List<Cafe> consultar() {
        List<Cafe> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from cafe;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Cafe cafe = new Cafe();
                cafe.setId(rs.getInt("id"));
                cafe.setCafe(rs.getString("cafe"));
                cafe.setLotacao(rs.getInt("lotacao"));
                lista.add(cafe);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Cafe.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ResultSet consultarInner() {
        Connection con = Conexao.conectar();
        String sql = "select a.nome, s.sala, c.cafe " +
                "from aluno a, sala s, cafe c " +
                "where a.idSala1 = s.id " +
                "and a.idSala2 = s.id " +
                "and s.idCafe = c.id " +
                "order by c.id;";
        ResultSet rs = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Cafe.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCafe() {
        return cafe;
    }

    public void setCafe(String cafe) {
        this.cafe = cafe;
    }

    public int getLotacao() {
        return lotacao;
    }

    public void setLotacao(int lotacao) {
        this.lotacao = lotacao;
    }

}

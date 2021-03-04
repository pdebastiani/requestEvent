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

public class Sala {
    
    private int id;
    private String sala;
    private int lotacao;
    private int idCafe;

    public boolean salvar() {
        Connection con = Conexao.conectar();
        String sql = "insert into sala(sala, lotacao, idCafe) "
                + "values(?, ?, ?);";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.sala);
            stm.setInt(2, this.lotacao);
            stm.setInt(3, this.idCafe);
            stm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Sala.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public boolean alterar() {
        Connection con = Conexao.conectar();
        String sql = "update sala set "
                + "sala = ?, "
                + "lotacao = ?, "
                + "idCafe = ? "
                + "where id = ?;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.sala);
            stm.setInt(2, this.lotacao);
            stm.setInt(3, this.idCafe);
            stm.setInt(4, this.id);
            stm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Sala.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "delete from sala "
                + "where id = ?;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Sala.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public Sala consultar(int pId) {
        Connection con = Conexao.conectar();
        String sql = "select * from sala "
                + "where id = ?;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                this.setId(rs.getInt("id"));
                this.setSala(rs.getString("sala"));
                this.setLotacao(rs.getInt("lotacao"));
                this.setIdCafe(rs.getInt("idcafe"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Sala.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this;
    }
    
    public List<Sala> consultar() {
        List<Sala> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from sala;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Sala sala = new Sala();
                sala.setId(rs.getInt("id"));
                sala.setSala(rs.getString("sala"));
                sala.setLotacao(rs.getInt("lotacao"));
                sala.setIdCafe(rs.getInt("idcafe"));
                lista.add(sala);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Sala.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ResultSet consultarInner() {
        Connection con = Conexao.conectar();
        String sql = "select s.id, s.sala, s.lotacao, c.cafe " +
                "from sala s, cafe c " +
                "where s.idCafe = c.id " +
                "order by s.id;";
        ResultSet rs = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Sala.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSala() {
        return sala;
    }

    public void setSala(String sala) {
        this.sala = sala;
    }

    public int getLotacao() {
        return lotacao;
    }

    public void setLotacao(int lotacao) {
        this.lotacao = lotacao;
    }

    public int getIdCafe() {
        return idCafe;
    }

    public void setIdCafe(int idCafe) {
        this.idCafe = idCafe;
    }
    
}

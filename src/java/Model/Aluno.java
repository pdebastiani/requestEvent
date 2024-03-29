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

public class Aluno {
    
    private int id;
    private String nome;
    private String sobrenome;
    private int idSala1;
    private int idSala2;
    
    public boolean salvar() {
        Connection con = Conexao.conectar();
        String sql = "insert into aluno(nome, sobrenome, idsala1, idsala2) "
                + "values(?, ?, ?, ?);";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.sobrenome);
            stm.setInt(3, this.idSala1);
            stm.setInt(4, this.idSala2);
            stm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Aluno.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public boolean alterar() {
        Connection con = Conexao.conectar();
        String sql = "update aluno set "
                + "nome = ?, "
                + "sobrenome = ?,"
                + "idsala1 = ?, "
                + "idsala2 = ? "
                + "where id = ?;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.sobrenome);
            stm.setInt(3, this.idSala1);
            stm.setInt(4, this.idSala2);
            stm.setInt(5, this.id);
            stm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Aluno.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "delete from aluno "
                + "where id = ?;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Aluno.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public Aluno consultar(int pId) {
        Connection con = Conexao.conectar();
        String sql = "select * from aluno "
                + "where id = ?;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                this.setId(rs.getInt("id"));
                this.setNome(rs.getString("nome"));
                this.setSobrenome(rs.getString("sobrenome"));
                this.setIdSala1(rs.getInt("idsala1"));
                this.setIdSala2(rs.getInt("idsala2"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Aluno.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this;
    }
    
    /*public List<Aluno> consultar() {
        List<Aluno> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from aluno;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Aluno aluno = new Aluno();
                aluno.setId(rs.getInt("id"));
                aluno.setNome(rs.getString("nome"));
                aluno.setSobrenome(rs.getString("sobrenome"));
                aluno.setIdSala1(rs.getInt("idsala1"));
                aluno.setIdSala2(rs.getInt("idsala2"));
                lista.add(aluno);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Aluno.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }*/
    
    public ResultSet consultar(String pEtapa) {
        Connection con = Conexao.conectar();
        String sql;
        if (pEtapa.contains("a")) {
            sql = "select a.nome || ' ' || a.sobrenome nomeCompleto, " +
                        "(select s1.sala " +
                        "from sala s1 " +
                        "where a.idSala1 = s1.id) etapa1, " +
                        "(select s2.sala " +
                        "from sala s2 " +
                        "where a.idSala2 = s2.id) etapa2 " +
                    "from aluno a " +
                    "group by a.idSala1, a.nome, a.sobrenome, a.idSala2 " +
                    "order by a.idSala1, a.nome, a.sobrenome;";
        } else {
            sql = "select a.nome || ' ' || a.sobrenome nomeCompleto, " +
                        "(select s1.sala " +
                        "from sala s1 " +
                        "where a.idSala1 = s1.id) etapa1, " +
                        "(select s2.sala " +
                        "from sala s2 " +
                        "where a.idSala2 = s2.id) etapa2 " +
                    "from aluno a " +
                    "group by a.idSala2, a.nome, a.sobrenome, a.idSala1 " +
                    "order by a.idSala2, a.nome, a.sobrenome;";
        }
        ResultSet rs = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Aluno.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
        
    public ResultSet consultarInner() {
        Connection con = Conexao.conectar();
        String sql = "select a.id, a.nome || ' ' || a.sobrenome nomeCompleto, " +
                    "(select s1.sala || ' --> ' || (select c1.cafe " +
                                                    "from cafe c1 " +
                                                    "where s1.idcafe = c1.id) etapa1ComCafe " +
                    "from sala s1 " +
                    "where a.idSala1 = s1.id), " +
                    "(select s2.sala || ' --> ' || (select c2.cafe " +
                                                    "from cafe c2 " +
                                                    "where s2.idcafe = c2.id) etapa2ComCafe " +
                    "from sala s2 " +
                    "where a.idSala2 = s2.id) " +
                    "from aluno a " +
                    "order by a.nome;";
        ResultSet rs = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Aluno.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public int getIdSala1() {
        return idSala1;
    }

    public void setIdSala1(int idSala1) {
        this.idSala1 = idSala1;
    }

    public int getIdSala2() {
        return idSala2;
    }

    public void setIdSala2(int idSala2) {
        this.idSala2 = idSala2;
    }

}

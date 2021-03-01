Siga estas informações iniciaos para ter Êxito nos testes deste Projeto:


Foi utilizados o Postgres como SGBD

Passo 1: Crie um database treinamento
Passo 2: execute dentro do datbase treinamento as informações contidas no arquivo
	"Comandos SQL para criar as tabelas.txt"


Basename: treinamento

JDBC URL: jdbc:postgresql://localhost:5432/postgres
Senha: 123

Abaixo segue a Classe de conexão utilizada:

public class Conexao {
    
    public static Connection conectar(){
        Connection con = null;
        String url = "jdbc:postgresql://localhost:5432/treinamento";
        String user = "postgres";
        String password = "123";
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro ao conectar com o banco (treinamento)");
        }
        return con;                
    }
}


Tecnologias utilizadas:

Java Web JSP
JDK - 8
IDE NetBeans 11.1
Postgres

Observações: 

- Não fiz testes Unitários: Sei do que se trata, já li sobre o assunto, 
	mas ainda não estudei a ferramenta. Vou precisar estudar sobre JUnit
- As listagens de consutas não estão perfeitas. Tive problemas para carregas 
	os ojetos relacionados. Vou corrigir isso.



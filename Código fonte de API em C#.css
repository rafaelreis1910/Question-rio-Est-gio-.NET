// Classe de domínio (DDD)
public class Aluno
{
    public int Id { get; set; }
    public string Nome { get; set; }
    public string CPF { get; set; }
    public string Email { get; set; }
}

public class Turma
{
    public int Id { get; set; }
    public int Numero { get; set; }
    public int AnoLetivo { get; set; }
}

public class Matricula
{
    public int Id { get; set; }
    public int AlunoId { get; set; }
    public int TurmaId { get; set; }
    public DateTime DataMatricula { get; set; }
}

// Contexto do Entity Framework
public class MeuContexto : DbContext
{
    public DbSet<Aluno> Alunos { get; set; }
    public DbSet<Turma> Turmas { get; set; }
    public DbSet<Matricula> Matriculas { get; set; }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        // Configuração do Code First Mapping
        modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        modelBuilder.Entity<Aluno>().HasKey(a => a.Id);
        modelBuilder.Entity<Turma>().HasKey(t => t.Id);
        modelBuilder.Entity<Matricula>().HasKey(m => m.Id);
        modelBuilder.Entity<Matricula>()
            .HasRequired(m => m.Aluno)
            .WithMany()
            .HasForeignKey(m => m.AlunoId)
            .WillCascadeOnDelete(false);
        modelBuilder.Entity<Matricula>()
            .HasRequired(m => m.Turma)
            .WithMany()
            .HasForeignKey(m => m.TurmaId)
            .WillCascadeOnDelete(false);
    }
}

// Interface do repositório
public interface IRepositorio<T> where T : class
{
    void Cadastrar(T entity);
    void Alterar(T entity);
    void Excluir(int id);
    T ObterPorId(int id);
    IEnumerable<T> ObterTodos();
}

// Implementação do repositório
public class Repositorio<T> : IRepositorio<T> where T : class
{
    private readonly MeuContexto _contexto;

    public Repositorio(MeuContexto contexto)
    {
        _contexto = contexto;
    }

    public void Cadastrar(T entity)
    {
        _contexto.Set<T>().Add(entity);
        _contexto.SaveChanges();
    }

    public void Alterar(T entity)
    {
        _contexto.Entry(entity).State = EntityState.Modified;
        _contexto.SaveChanges();
    }

    public void Excluir(int id)
    {
        var entity = ObterPorId(id);
        _contexto.Set<T>().Remove(entity);
        _contexto.SaveChanges();
    }

    public T ObterPorId(int id)
    {
        return _contexto.Set<T>().Find(id);
    }

    public IEnumerable<T> ObterTodos()
    {
        return _contexto.Set<T>().ToList();
    }
}

// Interface da camada de serviço
public interface IServico<T> where T : class
{
    void Cadastrar(T entity);
    void Alterar(T entity);
    void Excluir(int id);
    T ObterPorId(int id);
    IEnumerable<T> ObterTodos();
}

// Implementação da camada de serviço
public class Servico<T> : IServico<T> where T : class
{
    private readonly IRepositorio<T> _repositorio;

    public Serv

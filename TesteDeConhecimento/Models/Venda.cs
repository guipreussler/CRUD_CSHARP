namespace TesteDeConhecimento.Models
{
    public class Venda
    {
        public int Id { get; set; }

        public int ClienteId { get; set; }

        public int ProdutoId { get; set; }

        public int QtdVenda { get; set; }

        public decimal VlrUnitarioVenda { get; set; }

        public DateTime DthVenda { get; set; } = DateTime.Now;

        public decimal VlrTotalVenda { get; set; }
    }
}

using System.ComponentModel.DataAnnotations;

namespace TesteDeConhecimento.Models
{
    public class Produto
    {
        public int Id { get; set; }

        public string Descricao { get; set; }

        public decimal ValoUnitario { get; set; }
    }
}

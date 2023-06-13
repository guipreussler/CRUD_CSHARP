using System;
using System.Net.Http;
using System.Threading.Tasks;
namespace TesteDeConhecimento.Models;

public class Program
{
    public static async Task RealizarCargaDados()
    {
        try
        {
            var httpClient = new HttpClient();

            var clientesResponse = await httpClient.GetAsync("https://camposdealer.dev/Sites/TesteAPI/cliente");
            clientesResponse.EnsureSuccessStatusCode(); 
            var clientesContent = await clientesResponse.Content.ReadAsStringAsync();

            var vendasResponse = await httpClient.GetAsync("https://camposdealer.dev/Sites/TesteAPI/venda");
            vendasResponse.EnsureSuccessStatusCode();
            var vendasContent = await vendasResponse.Content.ReadAsStringAsync();


            var produtosResponse = await httpClient.GetAsync("https://camposdealer.dev/Sites/TesteAPI/produto");
            produtosResponse.EnsureSuccessStatusCode();
            var produtosContent = await produtosResponse.Content.ReadAsStringAsync();

            Console.WriteLine("Carga concluída com sucesso.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ocorreu um erro ao realizar a carga de informações: {ex.Message}");
        }
    }
}

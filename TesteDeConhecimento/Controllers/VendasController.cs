using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TesteDeConhecimento.Models;

namespace TesteDeConhecimento.Controllers
{
    public class VendasController : Controller
    {
        private readonly BancoDeDados _context;
        private object db;

        public List<Cliente> ObterClientes()
        {
            using (var dbContext = new BancoDeDados())
            {
                return dbContext.Clientes.ToList();
            }
        }

        public List<Produto> ObterProdutos()
        {
            using (var dbContext = new BancoDeDados())
            {
                return dbContext.Produtos.ToList();
            }
        }

        public VendasController(BancoDeDados context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
              return _context.Vendas != null ? 
                          View(await _context.Vendas.ToListAsync()) :
                          Problem("Entity set 'BancoDeDados.Vendas'  is null.");
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Vendas == null)
            {
                return NotFound();
            }

            var venda = await _context.Vendas
                .FirstOrDefaultAsync(m => m.Id == id);
            if (venda == null)
            {
                return NotFound();
            }

            return View(venda);
        }

        public IActionResult Create()
        {

            //Listar os clientes cadastrados
            List<Cliente> clientes = ObterClientes(); 
            ViewBag.Clientes = new SelectList(clientes, "Id", "nmCliente");

            //Listar os produtos cadastrados
            List<Produto> produtos = ObterProdutos();
            ViewBag.Produtos = new SelectList(produtos, "Id", "Descricao");

    
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,ClienteId,ProdutoId,QtdVenda,VlrUnitarioVenda,DthVenda,VlrTotalVenda")] Venda venda)
        {
                if (ModelState.IsValid)
                {

                // Definir valor unitário da venda a partir do valor do produto
                var produto = _context.Produtos.Where(x => x.Id == venda.ProdutoId).FirstOrDefault();
                venda.VlrUnitarioVenda = produto.ValoUnitario;

                // Definir valor total da venda a partir do calculo de quantidade
                venda.VlrTotalVenda = venda.QtdVenda * produto.ValoUnitario;
                _context.Add(venda);
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
                }

            return View(venda);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Vendas == null)
            {
                return NotFound();
            }

            var venda = await _context.Vendas.FindAsync(id);
            if (venda == null)
            {
                return NotFound();
            }

            //Listar os clientes cadastrados
            List<Cliente> clientes = ObterClientes();
            ViewBag.Clientes = new SelectList(clientes, "Id", "nmCliente");

            //Listar os produtos cadastrados
            List<Produto> produtos = ObterProdutos();
            ViewBag.Produtos = new SelectList(produtos, "Id", "Descricao");

            return View(venda);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,ClienteId,ProdutoId,QtdVenda,VlrUnitarioVenda,DthVenda,VlrTotalVenda")] Venda venda)
        {
            if (id != venda.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {

                    var produto = _context.Produtos.Where(x => x.Id == venda.ProdutoId).FirstOrDefault();
                    venda.VlrUnitarioVenda = produto.ValoUnitario;

                    // Definir valor total da venda a partir do calculo de quantidade
                    venda.VlrTotalVenda = venda.QtdVenda * produto.ValoUnitario;

                    _context.Update(venda);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!VendaExists(venda.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(venda);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Vendas == null)
            {
                return NotFound();
            }

            var venda = await _context.Vendas
                .FirstOrDefaultAsync(m => m.Id == id);
            if (venda == null)
            {
                return NotFound();
            }

            return View(venda);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Vendas == null)
            {
                return Problem("Entity set 'BancoDeDados.Vendas'  is null.");
            }
            var venda = await _context.Vendas.FindAsync(id);
            if (venda != null)
            {
                _context.Vendas.Remove(venda);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool VendaExists(int id)
        {
          return (_context.Vendas?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}

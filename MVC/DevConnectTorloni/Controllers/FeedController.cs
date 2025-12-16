using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using DevConnectTorloni.Contexts;
using DevConnectTorloni.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace DevConnectTorloni.Controllers
{
    public class FeedController : Controller
    {
        private readonly ILogger<FeedController> _logger;

        private readonly DevConnectContext _context;

        public FeedController(ILogger<FeedController> logger, DevConnectContext context)
        {
            _logger = logger;
            _context = context;
        }

private static List<TbPublicacao> publi = new List<TbPublicacao>();
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            try
            {
  List<TbPublicacao> publicacao = await _context.TbPublicacao.Include(p => p.IdUsuarioNavigation).ToListAsync();
                _context.Add(publicacao);
            }
            catch
            {
                
            }
            publi = _context.TbPublicacao.ToList();
            return View(publi);
        }

        //Cadastrar
        [HttpPost]
        public async Task<IActionResult> Index(IFormCollection form)
        {
            // System.Console.WriteLine($"{form["NomeCompleto"]}");
            // System.Console.WriteLine($"{form.Files[0].FileName} ");

            TbPublicacao NovaPublicacao = new TbPublicacao
            {
                Descricao = form["Descricao"].ToString(),

                //Coloca a data que foi criada a publicacao
                DataPublicacao = DateOnly.FromDateTime(DateTime.Now),
            };

            if (form.Files.Count > 0)
            {
                var file = form.Files[0];
                var folder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images");

                if (!Directory.Exists(folder))
                {
                    //Cria a pasta images
                    Directory.CreateDirectory(folder);
                }

                var path = Path.Combine(folder, file.FileName);

                using (var stream = new FileStream(path, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }

                NovaPublicacao.ImagemUrl = file.FileName;
            }


            try
            {
                //Adiciona o novo post na tabela publicacao
                _context.TbPublicacao.Add(NovaPublicacao);

                await _context.SaveChangesAsync();

                ViewBag.PublicacaoCadastrada = "cadastrado";

                return View (publi);
            }

            catch (Exception)
            {
                //Caso ocorra algum erro, retorna para a view de cadastro
                ViewBag.PublicacaoCadastrada = "Nao cadastrado";

                return View();
            }

        }
    }
}

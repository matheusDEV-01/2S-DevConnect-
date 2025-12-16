using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using DevConnectTorloni.Contexts;
using DevConnectTorloni.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace DevConnectTorloni.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly DevConnectContext _context;
        private readonly ILogger<UsuarioController> _logger;

        public UsuarioController(ILogger<UsuarioController> logger, DevConnectContext context)
        {
            _logger = logger;
            _context = context;
        }

        //
        [HttpGet]
        public IActionResult Index()
        {
            TempData["UsuarioNovoCadastrado"] = "";
            ViewBag.UsuarioNovoCadastrado = "";
            return View();
        }

        //Cadastrar
        [HttpPost]
        public async Task<IActionResult> Index(IFormCollection form)
        {
            // System.Console.WriteLine($"{form["NomeCompleto"]}");
            // System.Console.WriteLine($"{form.Files[0].FileName} ");

            TbUsuario novoUsuario = new TbUsuario
            {
                NomeCompleto = form["NomeCompleto"].ToString(),
                NomeDeUsuario = form["NomeDeUsuario"].ToString(),
                Email = form["Email"].ToString(),
                Senha = form["Senha"].ToString(),
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

                novoUsuario.FotoPerfilUrl = file.FileName;
            }

            else
            {
                novoUsuario.FotoPerfilUrl = "";
            }

            try
            {
                //Adiciona o novo usuario na tabela usuario
                _context.TbUsuario.Add(novoUsuario);

                await _context.SaveChangesAsync();

                TempData["UsuarioNovoCadastrado"] = "Cadastrado";
                ViewBag.UsuarioNovoCadastrado = "";

                return RedirectToAction("Index", "Home");
            }

            catch (System.Exception)
            {
                ViewBag.UsuarioNovoCadastrado = "Nao cadastrado";
                TempData["UsuarioNovoCadastrado"] = "";
                //vamos pedir para a view falar ao usuario que não foi possivel cadastrar
                return View();
            }

        }






        public IActionResult Perfil()
        {
            return View();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View("Error!");
        }
    }
}
using System;
using System.Collections.Generic;
using DevConnectTorloni.Models;
using Microsoft.EntityFrameworkCore;

namespace DevConnectTorloni.Contexts;

public partial class DevConnectContext : DbContext
{
    public DevConnectContext()
    {
    }

    public DevConnectContext(DbContextOptions<DevConnectContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TbComentario> TbComentario { get; set; }

    public virtual DbSet<TbComentarios> TbComentarios { get; set; }

    public virtual DbSet<TbCurtida> TbCurtida { get; set; }

    public virtual DbSet<TbPublicacao> TbPublicacao { get; set; }

    public virtual DbSet<TbUsuario> TbUsuario { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name= DevCon_SA");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TbComentario>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__tb_Comen__3213E83F1E266FEE");

            entity.HasOne(d => d.IdPublicacaoNavigation).WithMany(p => p.TbComentario)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tb_Coment__id_Pu__6383C8BA");

            entity.HasOne(d => d.IdUsuarioNavigation).WithMany(p => p.TbComentario)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tb_Coment__id_Us__6477ECF3");
        });

        modelBuilder.Entity<TbComentarios>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__tb_Comen__3213E83F5DB1CBA0");

            entity.HasOne(d => d.IdPublicacaoNavigation).WithMany(p => p.TbComentarios)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tb_Coment__id_Pu__68487DD7");

            entity.HasOne(d => d.IdUsuarioNavigation).WithMany(p => p.TbComentarios)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tb_Coment__id_Us__693CA210");
        });

        modelBuilder.Entity<TbCurtida>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__tb_Curti__3213E83FFED19C91");

            entity.HasOne(d => d.IdPublicacaoNavigation).WithMany(p => p.TbCurtida).HasConstraintName("FK__tb_Curtid__id_Pu__60A75C0F");

            entity.HasOne(d => d.IdUsuarioNavigation).WithMany(p => p.TbCurtida).HasConstraintName("FK__tb_Curtid__id_Us__5FB337D6");
        });

        modelBuilder.Entity<TbPublicacao>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__tb_Publi__3213E83F8D6C3683");

            entity.HasOne(d => d.IdUsuarioNavigation).WithMany(p => p.TbPublicacao).HasConstraintName("FK__tb_Public__id_Us__5CD6CB2B");
        });

        modelBuilder.Entity<TbUsuario>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__tb_Usuar__3213E83F42BD9D31");

            entity.Property(e => e.FotoPerfilUrl).HasDefaultValue("sem-foto.png");

            entity.HasMany(d => d.IdUsuarioSeguido).WithMany(p => p.IdUsuarioSeguir)
                .UsingEntity<Dictionary<string, object>>(
                    "TbSeguidor",
                    r => r.HasOne<TbUsuario>().WithMany()
                        .HasForeignKey("IdUsuarioSeguido")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__tb_Seguid__id_Us__05D8E0BE"),
                    l => l.HasOne<TbUsuario>().WithMany()
                        .HasForeignKey("IdUsuarioSeguir")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__tb_Seguid__id_Us__04E4BC85"),
                    j =>
                    {
                        j.HasKey("IdUsuarioSeguir", "IdUsuarioSeguido").HasName("PK__tb_Segui__134B0CB329630B58");
                        j.ToTable("tb_Seguidor");
                        j.IndexerProperty<int>("IdUsuarioSeguir").HasColumnName("id_Usuario_Seguir");
                        j.IndexerProperty<int>("IdUsuarioSeguido").HasColumnName("id_Usuario_Seguido");
                    });

            entity.HasMany(d => d.IdUsuarioSeguir).WithMany(p => p.IdUsuarioSeguido)
                .UsingEntity<Dictionary<string, object>>(
                    "TbSeguidor",
                    r => r.HasOne<TbUsuario>().WithMany()
                        .HasForeignKey("IdUsuarioSeguir")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__tb_Seguid__id_Us__04E4BC85"),
                    l => l.HasOne<TbUsuario>().WithMany()
                        .HasForeignKey("IdUsuarioSeguido")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__tb_Seguid__id_Us__05D8E0BE"),
                    j =>
                    {
                        j.HasKey("IdUsuarioSeguir", "IdUsuarioSeguido").HasName("PK__tb_Segui__134B0CB329630B58");
                        j.ToTable("tb_Seguidor");
                        j.IndexerProperty<int>("IdUsuarioSeguir").HasColumnName("id_Usuario_Seguir");
                        j.IndexerProperty<int>("IdUsuarioSeguido").HasColumnName("id_Usuario_Seguido");
                    });
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

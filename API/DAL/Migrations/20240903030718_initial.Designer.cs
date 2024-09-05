﻿// <auto-generated />
using System;
using DAL;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Oracle.EntityFrameworkCore.Metadata;

#nullable disable

namespace DAL.Migrations
{
    [DbContext(typeof(BancoAPIContext))]
    [Migration("20240903030718_initial")]
    partial class initial
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.8")
                .HasAnnotation("Proxies:ChangeTracking", false)
                .HasAnnotation("Proxies:CheckEquality", false)
                .HasAnnotation("Proxies:LazyLoading", true)
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            OracleModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("DAL.Models.Distrito", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("NUMBER(10)");

                    OraclePropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("Cd_Dist")
                        .HasMaxLength(7)
                        .HasColumnType("NUMBER(10)");

                    b.Property<string>("Cord_Central")
                        .IsRequired()
                        .HasColumnType("SDO_GEOMETRY");

                    b.Property<string>("Nm_Dist")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("NVARCHAR2(100)");

                    b.Property<int>("Zona_Id")
                        .HasColumnType("NUMBER(10)");

                    b.HasKey("Id");

                    b.HasIndex("Zona_Id");

                    b.ToTable("TBL_Distrito");
                });

            modelBuilder.Entity("DAL.Models.Municipio", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("NUMBER(10)");

                    OraclePropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<double>("Area_Km2")
                        .HasPrecision(10, 2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<int>("Cod_Mun")
                        .HasMaxLength(7)
                        .HasColumnType("NUMBER(10)");

                    b.Property<string>("Cord_Central")
                        .IsRequired()
                        .HasColumnType("SDO_GEOMETRY");

                    b.Property<string>("Geometry")
                        .IsRequired()
                        .HasColumnType("SDO_GEOMETRY");

                    b.Property<string>("Nm_Mun")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("NVARCHAR2(100)");

                    b.Property<string>("Sg_Estado")
                        .IsRequired()
                        .HasMaxLength(2)
                        .HasColumnType("NVARCHAR2(2)");

                    b.HasKey("Id");

                    b.ToTable("TBL_Municipio");
                });

            modelBuilder.Entity("DAL.Models.Previsao", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("NUMBER(10)");

                    OraclePropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateTime>("Data")
                        .HasColumnType("TIMESTAMP(7)");

                    b.Property<double>("Pressao_Atm")
                        .HasPrecision(5, 2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<double>("Temperatura_Max")
                        .HasPrecision(2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<double>("Temperatura_Min")
                        .HasPrecision(5, 2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<string>("Tipo_Nuvem")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("NVARCHAR2(50)");

                    b.Property<double>("Umidade_Max")
                        .HasPrecision(5, 2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<double>("Umidade_Min")
                        .HasPrecision(5, 2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<double>("Velocidade_Vento")
                        .HasPrecision(5, 2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<double>("Volume_Precipitacao")
                        .HasPrecision(5, 2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<int>("Zona_Id")
                        .HasColumnType("NUMBER(10)");

                    b.HasKey("Id");

                    b.HasIndex("Zona_Id");

                    b.ToTable("TBL_Previsao");
                });

            modelBuilder.Entity("DAL.Models.PrevisaoFutura", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("NUMBER(10)");

                    OraclePropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateTime>("Data_Futura")
                        .HasColumnType("TIMESTAMP(7)");

                    b.Property<DateTime>("Data_Referencia")
                        .HasColumnType("TIMESTAMP(7)");

                    b.Property<int>("Hora")
                        .HasMaxLength(2)
                        .HasColumnType("NUMBER(10)");

                    b.Property<double>("Pressao_Atm")
                        .HasPrecision(5, 2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<double>("Temperatura_Max")
                        .HasPrecision(2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<double>("Temperatura_Min")
                        .HasPrecision(5, 2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<string>("Tipo_Nuvem")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("NVARCHAR2(50)");

                    b.Property<double>("Umidade_Max")
                        .HasPrecision(5, 2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<double>("Umidade_Min")
                        .HasPrecision(5, 2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<double>("Velocidade_Vento")
                        .HasPrecision(5, 2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<double>("Volume_Precipitacao")
                        .HasPrecision(5, 2)
                        .HasColumnType("BINARY_DOUBLE");

                    b.Property<int>("Zona_Id")
                        .HasColumnType("NUMBER(10)");

                    b.HasKey("Id");

                    b.HasIndex("Zona_Id");

                    b.ToTable("TBL_Previsao_Futura");
                });

            modelBuilder.Entity("DAL.Models.Zona", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("NUMBER(10)");

                    OraclePropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Cord_Central")
                        .IsRequired()
                        .HasColumnType("NVARCHAR2(2000)");

                    b.Property<string>("Geometry")
                        .IsRequired()
                        .HasColumnType("NVARCHAR2(2000)");

                    b.Property<int>("Municipio_Id")
                        .HasColumnType("NUMBER(10)");

                    b.Property<string>("Nome_Zona")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("NVARCHAR2(50)");

                    b.HasKey("Id");

                    b.HasIndex("Municipio_Id");

                    b.ToTable("TBL_Zona");
                });

            modelBuilder.Entity("DAL.Models.Distrito", b =>
                {
                    b.HasOne("DAL.Models.Zona", "Zona")
                        .WithMany("Distrios")
                        .HasForeignKey("Zona_Id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Zona");
                });

            modelBuilder.Entity("DAL.Models.Previsao", b =>
                {
                    b.HasOne("DAL.Models.Zona", "Zona")
                        .WithMany()
                        .HasForeignKey("Zona_Id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Zona");
                });

            modelBuilder.Entity("DAL.Models.PrevisaoFutura", b =>
                {
                    b.HasOne("DAL.Models.Zona", "Zona")
                        .WithMany()
                        .HasForeignKey("Zona_Id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Zona");
                });

            modelBuilder.Entity("DAL.Models.Zona", b =>
                {
                    b.HasOne("DAL.Models.Municipio", "Municipio")
                        .WithMany()
                        .HasForeignKey("Municipio_Id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Municipio");
                });

            modelBuilder.Entity("DAL.Models.Zona", b =>
                {
                    b.Navigation("Distrios");
                });
#pragma warning restore 612, 618
        }
    }
}

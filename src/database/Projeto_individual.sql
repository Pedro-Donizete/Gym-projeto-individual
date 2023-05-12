create database Projeto_individual;
use Projeto_individual;


create table Usuario(
IdUsuario int primary key auto_increment,
Nome varchar(45),
email varchar(50),
senha varchar(30));

create table Controle_de_Peso(
idPeso int primary key auto_increment,
PesoKG char(250),
tempoMes varchar(12)) auto_increment = 100;

insert into Usuario ( nome, email, senha) values
('pedro', 'pedro@gmail.com', '1234');

alter table Usuario modify column peso double;

select * from Usuario;

alter table Usuario modify column peso decimal
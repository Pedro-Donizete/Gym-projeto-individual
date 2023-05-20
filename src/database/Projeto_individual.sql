create database Projeto_individual;
use Projeto_individual;
drop database projeto_individual;


create table Usuario(
idUsuario int primary key auto_increment,
nome varchar(45),
email varchar(50),
senha varchar(30),
ft_usuario varbinary(6000));

create table Controle_de_Peso(
idPeso int primary key auto_increment,
inicialPesoKG decimal(10,2),
pesoPmes decimal(10,2),
tempoMes varchar(3),
fkUsuario int,
 constraint fkUsuario foreign key(FkUsuario) references Usuario(idUsuario)) auto_increment = 1000;
	

select * from Usuario join Controle_de_Peso on 
	fkUsuario = idUsuario;
    
    SELECT * FROM Controle_de_Peso WHERE fkUsuario = 2;



select * from Usuario;
select * from Controle_de_Peso;
desc controle_de_peso;

truncate table Usuario;
truncate table Controle_de_Peso;

insert into usuario (email, senha) values 
	('pedro@email.com', '123');

alter table Controle_de_Peso add constraint chktempoMes check 
	(tempoMes in ('jan', 'fev', 'abr', 'mai', 'jun','jul', 'ago', 'set', 'out', 'nov', 'dez'));
    
 INSERT INTO Controle_de_peso VALUES 
        (null, 56,10, 'nov', 2);
        
update Controle_de_Peso set pesoPmes = 200, tempoMes = 'jan' where idpeso = 1001;

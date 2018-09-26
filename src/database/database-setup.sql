-- MySQL Script generated by MySQL Workbench
-- Wed Sep 26 09:48:05 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema laddres
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema laddres
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `laddres` DEFAULT CHARACTER SET utf8 ;
USE `laddres` ;

-- -----------------------------------------------------
-- Table `laddres`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`estado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sigla` CHAR(2) NOT NULL,
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`cidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo_tse` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cidade_estado1_idx` (`estado_id` ASC),
  CONSTRAINT `fk_cidade_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `laddres`.`estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`ocupacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`ocupacao` (
  `id` INT NOT NULL COMMENT 'Código disponibilizado pelo TSE',
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`nacionalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`nacionalidade` (
  `id` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`grau_instrucao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`grau_instrucao` (
  `id` INT NOT NULL COMMENT 'Código disponibilizado pelo TSE',
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`candidato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`candidato` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(145) NULL,
  `data_nascimento` DATETIME NULL,
  `cpf` CHAR(11) NULL,
  `titulo_eleitoral` CHAR(12) NULL,
  `email` VARCHAR(255) NULL,
  `cidade_id` INT NULL,
  `ocupacao_id` INT NOT NULL,
  `nacionalidade_id` INT NOT NULL,
  `grau_instrucao_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_candidato_cidade_idx` (`cidade_id` ASC),
  INDEX `fk_candidato_ocupacao1_idx` (`ocupacao_id` ASC),
  INDEX `fk_candidato_nacionalidade1_idx` (`nacionalidade_id` ASC),
  INDEX `fk_candidato_grau_instrucao1_idx` (`grau_instrucao_id` ASC),
  INDEX `cpf_titulo` (`cpf` ASC, `titulo_eleitoral` ASC),
  CONSTRAINT `fk_candidato_cidade`
    FOREIGN KEY (`cidade_id`)
    REFERENCES `laddres`.`cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidato_ocupacao1`
    FOREIGN KEY (`ocupacao_id`)
    REFERENCES `laddres`.`ocupacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidato_nacionalidade1`
    FOREIGN KEY (`nacionalidade_id`)
    REFERENCES `laddres`.`nacionalidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidato_grau_instrucao1`
    FOREIGN KEY (`grau_instrucao_id`)
    REFERENCES `laddres`.`grau_instrucao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`eleicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`eleicao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ano` INT NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`partido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`partido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` INT NOT NULL,
  `sigla` VARCHAR(20) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`cargo` (
  `id` INT NOT NULL COMMENT 'Código disponibilizado pelo TSE',
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`situacao_candidatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`situacao_candidatura` (
  `id` INT NOT NULL COMMENT 'Código disponibilizado pelo TSE',
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`resultado_candidatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`resultado_candidatura` (
  `id` INT NOT NULL COMMENT 'Código disponibilizado pelo TSE',
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`candidatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`candidatura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `eleicao_id` INT NULL,
  `turno` INT NULL,
  `candidato_id` INT NULL,
  `cidade_id` INT NULL,
  `estado_id` INT NULL,
  `numero_candidato` INT NULL,
  `nome_urna` VARCHAR(255) NULL,
  `partido_id` INT NULL,
  `legenda_nome` VARCHAR(255) NULL,
  `legenda_composicao` VARCHAR(255) NULL,
  `cargo_id` INT NULL,
  `despesa_maxima` INT NULL,
  `situacao_candidatura_id` INT NULL,
  `resultado_candidatura_id` INT NULL,
  `sequencial_candidato` VARCHAR(12) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_candidatura_cidade1_idx` (`cidade_id` ASC),
  INDEX `fk_candidatura_estado1_idx` (`estado_id` ASC),
  INDEX `fk_candidatura_eleicao1_idx` (`eleicao_id` ASC),
  INDEX `fk_candidatura_partido1_idx` (`partido_id` ASC),
  INDEX `fk_candidatura_cargo1_idx` (`cargo_id` ASC),
  INDEX `fk_candidatura_situacao_candidatura1_idx` (`situacao_candidatura_id` ASC),
  INDEX `fk_candidatura_resultado1_idx` (`resultado_candidatura_id` ASC),
  INDEX `fk_candidatura_candidato1_idx` (`candidato_id` ASC),
  CONSTRAINT `fk_candidatura_cidade1`
    FOREIGN KEY (`cidade_id`)
    REFERENCES `laddres`.`cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidatura_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `laddres`.`estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidatura_eleicao1`
    FOREIGN KEY (`eleicao_id`)
    REFERENCES `laddres`.`eleicao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidatura_partido1`
    FOREIGN KEY (`partido_id`)
    REFERENCES `laddres`.`partido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidatura_cargo1`
    FOREIGN KEY (`cargo_id`)
    REFERENCES `laddres`.`cargo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidatura_situacao_candidatura1`
    FOREIGN KEY (`situacao_candidatura_id`)
    REFERENCES `laddres`.`situacao_candidatura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidatura_resultado1`
    FOREIGN KEY (`resultado_candidatura_id`)
    REFERENCES `laddres`.`resultado_candidatura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidatura_candidato1`
    FOREIGN KEY (`candidato_id`)
    REFERENCES `laddres`.`candidato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`camara_legislatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`camara_legislatura` (
  `id` INT NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_fim` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`camara_tipo_orgao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`camara_tipo_orgao` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`camara_orgao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`camara_orgao` (
  `id` INT NOT NULL,
  `nome` VARCHAR(2550) NOT NULL,
  `sigla` VARCHAR(255) NOT NULL,
  `apelido` VARCHAR(255) NULL,
  `camara_tipo_orgao_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_camara_orgao_camara_tipo_orgao1_idx` (`camara_tipo_orgao_id` ASC),
  CONSTRAINT `fk_camara_orgao_camara_tipo_orgao1`
    FOREIGN KEY (`camara_tipo_orgao_id`)
    REFERENCES `laddres`.`camara_tipo_orgao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`deputado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`deputado` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NULL,
  `nome_civil` VARCHAR(255) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `data_falecimento` DATE NULL,
  `sexo` VARCHAR(2) NULL,
  `sigla_partido` VARCHAR(20) NOT NULL,
  `sigla_uf` VARCHAR(2) NOT NULL,
  `municipio_nascimento` VARCHAR(100) NULL,
  `uf_nascimento` VARCHAR(2) NULL,
  `data_ultimo_status` DATE NULL,
  `gabinete_nome` VARCHAR(45) NULL,
  `gabinete_predio` VARCHAR(45) NULL,
  `gabinete_sala` VARCHAR(45) NULL,
  `gabinete_andar` VARCHAR(45) NULL,
  `gabinete_telefone` VARCHAR(45) NULL,
  `gabinete_email` VARCHAR(100) NULL,
  `website` VARCHAR(100) NULL,
  `candidato_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_deputado_candidato1_idx` (`candidato_id` ASC),
  CONSTRAINT `fk_deputado_candidato1`
    FOREIGN KEY (`candidato_id`)
    REFERENCES `laddres`.`candidato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`camara_mandato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`camara_mandato` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `camara_legislatura_id` INT NOT NULL,
  `deputado_id` INT NOT NULL,
  INDEX `fk_camara_mandatos_camara_legislatura1_idx` (`camara_legislatura_id` ASC),
  INDEX `fk_camara_mandatos_deputado1_idx` (`deputado_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_camara_mandatos_camara_legislatura1`
    FOREIGN KEY (`camara_legislatura_id`)
    REFERENCES `laddres`.`camara_legislatura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_camara_mandatos_deputado1`
    FOREIGN KEY (`deputado_id`)
    REFERENCES `laddres`.`deputado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`camara_papel_orgao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`camara_papel_orgao` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`camara_participacao_orgao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`camara_participacao_orgao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `camara_legislatura_id` INT NOT NULL,
  `camara_orgao_id` INT NOT NULL,
  `deputado_id` INT NOT NULL,
  `camara_papel_orgao_id` INT NOT NULL,
  `data_inicio` DATE NOT NULL,
  `data_fim` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_camara_participacao_orgao_camara_legislatura1_idx` (`camara_legislatura_id` ASC),
  INDEX `fk_camara_participacao_orgao_camara_orgao1_idx` (`camara_orgao_id` ASC),
  INDEX `fk_camara_participacao_orgao_deputado1_idx` (`deputado_id` ASC),
  INDEX `fk_camara_participacao_orgao_camara_papel_orgao1_idx` (`camara_papel_orgao_id` ASC),
  CONSTRAINT `fk_camara_participacao_orgao_camara_legislatura1`
    FOREIGN KEY (`camara_legislatura_id`)
    REFERENCES `laddres`.`camara_legislatura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_camara_participacao_orgao_camara_orgao1`
    FOREIGN KEY (`camara_orgao_id`)
    REFERENCES `laddres`.`camara_orgao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_camara_participacao_orgao_deputado1`
    FOREIGN KEY (`deputado_id`)
    REFERENCES `laddres`.`deputado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_camara_participacao_orgao_camara_papel_orgao1`
    FOREIGN KEY (`camara_papel_orgao_id`)
    REFERENCES `laddres`.`camara_papel_orgao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`camara_proposicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`camara_proposicao` (
  `id` INT NOT NULL,
  `tipo_id` INT NOT NULL,
  `tipo_sigla` VARCHAR(10) NOT NULL,
  `numero` INT NOT NULL,
  `ano` INT NOT NULL,
  `ementa` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`camara_proposicao_deputado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`camara_proposicao_deputado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `camara_proposicao_id` INT NOT NULL,
  `deputado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_camara_proposicao_deputado_camara_proposicao1_idx` (`camara_proposicao_id` ASC),
  INDEX `fk_camara_proposicao_deputado_deputado1_idx` (`deputado_id` ASC),
  CONSTRAINT `fk_camara_proposicao_deputado_camara_proposicao1`
    FOREIGN KEY (`camara_proposicao_id`)
    REFERENCES `laddres`.`camara_proposicao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_camara_proposicao_deputado_deputado1`
    FOREIGN KEY (`deputado_id`)
    REFERENCES `laddres`.`deputado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`camara_proposicao_detalhada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`camara_proposicao_detalhada` (
  `id` INT NOT NULL,
  `data_apresentacao` DATE NOT NULL,
  `data_ultimo_status` DATE NOT NULL,
  `descricao_tramitacao` VARCHAR(100) NOT NULL,
  `descricao_situacao` VARCHAR(100) NOT NULL,
  `keywords` TEXT NOT NULL,
  `url_integra` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_camara_proposicao_detalhada_camara_proposicao1_idx` (`id` ASC),
  CONSTRAINT `fk_camara_proposicao_detalhada_camara_proposicao1`
    FOREIGN KEY (`id`)
    REFERENCES `laddres`.`camara_proposicao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`tema_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`tema_categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`camara_proposicao_votacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`camara_proposicao_votacao` (
  `id` INT NOT NULL,
  `camara_proposicao_id` INT NOT NULL,
  PRIMARY KEY (`id`, `camara_proposicao_id`),
  INDEX `fk_camara_proposicao_votacao_camara_proposicao_detalhada1_idx` (`camara_proposicao_id` ASC),
  CONSTRAINT `fk_camara_proposicao_votacao_camara_proposicao_detalhada1`
    FOREIGN KEY (`camara_proposicao_id`)
    REFERENCES `laddres`.`camara_proposicao_detalhada` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`tema` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tema_categoria_id` INT NOT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `descricao` TEXT NULL,
  `origem_imprensa` TINYINT NOT NULL DEFAULT 0,
  `camara_proposicao_id` INT NULL,
  `camara_proposicao_votacao_id` INT NULL,
  `senado_proposicao_id` INT NULL,
  `senado_proposicao_votacao_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tema_tema_categoria1_idx` (`tema_categoria_id` ASC),
  INDEX `fk_tema_camara_proposicao_votacao1_idx` (`camara_proposicao_votacao_id` ASC, `camara_proposicao_id` ASC),
  CONSTRAINT `fk_tema_tema_categoria1`
    FOREIGN KEY (`tema_categoria_id`)
    REFERENCES `laddres`.`tema_categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tema_camara_proposicao_votacao1`
    FOREIGN KEY (`camara_proposicao_votacao_id` , `camara_proposicao_id`)
    REFERENCES `laddres`.`camara_proposicao_votacao` (`id` , `camara_proposicao_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`tema_posicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`tema_posicao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(20) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`tema_posicao_candidato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`tema_posicao_candidato` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `candidato_id` INT NOT NULL,
  `tema_id` INT NOT NULL,
  `tema_posicao_id` INT NOT NULL,
  `url_fonte` VARCHAR(255) NOT NULL COMMENT 'Link para fonte',
  PRIMARY KEY (`id`),
  INDEX `fk_tema_posicao_tema1_idx` (`tema_id` ASC),
  INDEX `fk_tema_posicao_candidato1_idx` (`candidato_id` ASC),
  INDEX `fk_tema_posicao_tema_posicao1_idx` (`tema_posicao_id` ASC),
  CONSTRAINT `fk_tema_posicao_tema1`
    FOREIGN KEY (`tema_id`)
    REFERENCES `laddres`.`tema` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tema_posicao_candidato1`
    FOREIGN KEY (`candidato_id`)
    REFERENCES `laddres`.`candidato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tema_posicao_tema_posicao1`
    FOREIGN KEY (`tema_posicao_id`)
    REFERENCES `laddres`.`tema_posicao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`camara_proposicao_votacao_voto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`camara_proposicao_votacao_voto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `voto` TINYINT NULL,
  `camara_proposicao_votacao_id` INT NOT NULL,
  `camara_proposicao_votacao_camara_proposicao_id` INT NOT NULL,
  `deputado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_camara_proposicao_votacao_voto_camara_proposicao_votacao_idx` (`camara_proposicao_votacao_id` ASC, `camara_proposicao_votacao_camara_proposicao_id` ASC),
  INDEX `fk_camara_proposicao_votacao_voto_deputado1_idx` (`deputado_id` ASC),
  CONSTRAINT `fk_camara_proposicao_votacao_voto_camara_proposicao_votacao1`
    FOREIGN KEY (`camara_proposicao_votacao_id` , `camara_proposicao_votacao_camara_proposicao_id`)
    REFERENCES `laddres`.`camara_proposicao_votacao` (`id` , `camara_proposicao_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_camara_proposicao_votacao_voto_deputado1`
    FOREIGN KEY (`deputado_id`)
    REFERENCES `laddres`.`deputado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`tema_link`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`tema_link` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tema_id` INT NOT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `short_url` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tema_link_tema1_idx` (`tema_id` ASC),
  CONSTRAINT `fk_tema_link_tema1`
    FOREIGN KEY (`tema_id`)
    REFERENCES `laddres`.`tema` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`usuario` (
  `id` VARCHAR(255) NOT NULL COMMENT 'UniqueID gerado pelo react-native',
  `user_agent` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`like` (
  `candidato_id` INT NOT NULL,
  `usuario_id` VARCHAR(255) NOT NULL,
  INDEX `fk_like_candidato1_idx` (`candidato_id` ASC),
  INDEX `fk_like_usuario1_idx` (`usuario_id` ASC),
  PRIMARY KEY (`candidato_id`, `usuario_id`),
  CONSTRAINT `fk_like_candidato1`
    FOREIGN KEY (`candidato_id`)
    REFERENCES `laddres`.`candidato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `laddres`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`politico_vigieaqui`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`politico_vigieaqui` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(80) NULL,
  `processado` TINYINT NOT NULL,
  `candidato_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_politico_vigieaqui_candidato1_idx` (`candidato_id` ASC),
  CONSTRAINT `fk_politico_vigieaqui_candidato1`
    FOREIGN KEY (`candidato_id`)
    REFERENCES `laddres`.`candidato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laddres`.`processo_judicial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laddres`.`processo_judicial` (
  `id` INT NOT NULL,
  `numero` VARCHAR(255) NOT NULL,
  `tipo` VARCHAR(255) NOT NULL,
  `tribunal` VARCHAR(255) NOT NULL,
  `descricao` TEXT NULL,
  `link` TEXT NOT NULL,
  `politico_vigieaqui_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_processo_judicial_politico_vigieaqui1_idx` (`politico_vigieaqui_id` ASC),
  CONSTRAINT `fk_processo_judicial_politico_vigieaqui1`
    FOREIGN KEY (`politico_vigieaqui_id`)
    REFERENCES `laddres`.`politico_vigieaqui` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
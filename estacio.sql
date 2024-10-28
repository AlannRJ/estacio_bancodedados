CREATE TABLE aluno (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    sexo CHAR(1) NOT NULL CHECK (sexo IN ('M', 'F')),
    matricula VARCHAR(20) NOT NULL
);

CREATE TABLE responsavel (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    telefone_contato VARCHAR(15) NOT NULL,
    cpf_aluno VARCHAR(11) NOT NULL,
    CONSTRAINT fk_aluno FOREIGN KEY (cpf_aluno) REFERENCES aluno(cpf)
);

CREATE TABLE escola (
    nome VARCHAR(100) NOT NULL,
    cnpj CHAR(14) PRIMARY KEY,
    cep VARCHAR(8) NOT NULL,
    telefone_contato VARCHAR(15) NOT NULL,
    email_contato VARCHAR(100) NOT NULL
);

CREATE TABLE aluno_escola (
    cpf_aluno VARCHAR(11) NOT NULL,
    cnpj_escola CHAR(14) NOT NULL,
    PRIMARY KEY (cpf_aluno, cnpj_escola),
    CONSTRAINT fk_aluno_escola FOREIGN KEY (cpf_aluno) REFERENCES aluno(cpf),
    CONSTRAINT fk_escola_aluno FOREIGN KEY (cnpj_escola) REFERENCES escola(cnpj)
);



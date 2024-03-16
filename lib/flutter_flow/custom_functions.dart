import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String>? ordemaleatoria(
  String? alternativa1,
  String? alternativa2,
  String? alternativa3,
  String? alternativa4,
) {
  // retorna quatro alternativas em ordem aleatória
  List<String> alternativas = [
    alternativa1 ?? '',
    alternativa2 ?? '',
    alternativa3 ?? '',
    alternativa4 ?? ''
  ];
  alternativas.shuffle();
  return alternativas;
}

List<FFUploadedFile>? juntarimagens(
  FFUploadedFile? imagem1,
  FFUploadedFile? imagem2,
) {
  // junta as imagens
// retorna uma lista com as duas imagens juntas
  if (imagem1 == null && imagem2 == null) {
    return null;
  } else if (imagem1 == null) {
    return [imagem2!];
  } else if (imagem2 == null) {
    return [imagem1];
  } else {
    return [imagem1, imagem2];
  }
}

List<String>? criarlista(
  String? a1,
  String? a2,
  String? a3,
  String? a4,
  String? a5,
  String? a6,
  String? a7,
  String? a8,
  String? a9,
  String? a10,
  String? a11,
  String? a12,
) {
  // juntar argumentos em lista
// junta os argumentos em uma lista
  return [
    a1 ?? '',
    a2 ?? '',
    a3 ?? '',
    a4 ?? '',
    a5 ?? '',
    a6 ?? '',
    a7 ?? '',
    a8 ?? '',
    a9 ?? '',
    a10 ?? '',
    a11 ?? '',
    a12 ?? ''
  ];
}

List<String> extraideckCODE(List<DeckRecord> docs) {
  // retorna lista com decknomes
  List<String> deckNames = [];
  for (var doc in docs) {
    deckNames.add(doc.deckcode);
  }
  return deckNames;
}

List<String> extraisubdeck(List<SubRecord> docs) {
  // extrai lista de subnomes
  List<String> subnames = [];
  for (var doc in docs) {
    subnames.add(doc.subnome);
  }
  return subnames;
}

List<String> extraiescolaCODE(List<EscolaRecord> docs) {
  // retorna lista com escolanomes
  List<String> escolaNomes = [];
  for (var doc in docs) {
    escolaNomes.add(doc.escolacode);
  }
  return escolaNomes;
}

List<String> extraiquestcode(List<QuestRecord> docs) {
  List<String> escolaNomes = [];
  for (var doc in docs) {
    escolaNomes.add(doc.questcode);
  }
  return escolaNomes;
}

List<String> extraideck(List<DeckRecord> docs) {
  // retorna lista com decknomes
  List<String> deckNames = [];
  for (var doc in docs) {
    deckNames.add(doc.decknome);
  }
  return deckNames;
}

List<String> extraisubdeckCODE(List<SubRecord> docs) {
  // extrai lista de subnomes
  List<String> subnames = [];
  for (var doc in docs) {
    subnames.add(doc.subcode);
  }
  return subnames;
}

List<String> extraisubsubdeck(List<SubsubRecord> docs) {
  // retorna lista com field subsubnome
  List<String> subsubnomes = [];
  for (var doc in docs) {
    subsubnomes.add(doc.subsubnome);
  }
  return subsubnomes;
}

List<String> extraisubsubdeckCODE(List<SubsubRecord> docs) {
  // retorna lista com field subsubnome
  List<String> subsubnomes = [];
  for (var doc in docs) {
    subsubnomes.add(doc.subsubcode);
  }
  return subsubnomes;
}

String? listaemstring(List<String>? lista) {
  // retorna lista como uma string dividida por ", "
// retorna lista como uma string dividida por ", "
  if (lista == null || lista.isEmpty) {
    return null;
  } else {
    return lista.join(', ');
  }
}

List<String> addtolista(
  List<String> lista,
  String string,
) {
  // adiciona string como primeiro item da lista
  lista.insert(0, string);
  return lista;
}

List<String> extraiescola(List<EscolaRecord> docs) {
  // retorna lista com escolanomes
  List<String> escolaNomes = [];
  for (var doc in docs) {
    escolaNomes.add(doc.escolanome);
  }
  return escolaNomes;
}

int soma(
  int nro1,
  int nro2,
) {
  return nro1 + nro2;
}

bool procuranomedecktrueestarepetido(
  List<DeckRecord>? decks,
  String? decknome,
) {
  // retorna verdadeiro se decknome está na lista de deknomes dos docs
  if (decks == null || decknome == null) {
    return false;
  }
  for (var deck in decks) {
    if (deck.decknome == decknome) {
      return true;
    }
  }
  return false;
}

List<String>? subdesativadolistadecks(List<SubRecord>? subs) {
  // retorna lista de "deckcode" sem repetições
  if (subs == null || subs.isEmpty) {
    return null;
  }

  final deckcodes = <String>{};

  for (final sub in subs) {
    if (sub.deckcode != null) {
      deckcodes.add(sub.deckcode!);
    }
  }

  return deckcodes.toList();
}

List<String>? subsubdesativadolistasub(List<SubsubRecord>? subsubs) {
  // retorna lista de "subcode" sem repetição
  if (subsubs == null || subsubs.isEmpty) {
    return null;
  }

  final subCodes = <String>{};
  for (final subsub in subsubs) {
    subCodes.add(subsub.subcode);
  }

  return subCodes.toList();
}

List<String>? xcodigos(String? nro) {
  // retorna lista de nro strings aleatorias de 6 digitos podendo contem letras e numeros, sem repetições
  List<String> result = [];
  int count = int.tryParse(nro ?? '') ?? 0;
  if (count <= 0) {
    return null;
  }
  while (result.length < count) {
    String code = '';
    for (int i = 0; i < 6; i++) {
      int randomInt = math.Random().nextInt(36);
      if (randomInt < 10) {
        code += randomInt.toString();
      } else {
        code += String.fromCharCode(randomInt + 87);
      }
    }
    if (!result.contains(code)) {
      result.add(code);
    }
  }
  return result;
}

List<String>? juntarlistas(
  List<String>? lista1,
  List<String>? lista2,
) {
  // junta as duas listas
  if (lista1 == null && lista2 == null) {
    return null;
  } else if (lista1 == null) {
    return lista2;
  } else if (lista2 == null) {
    return lista1;
  } else {
    return [...lista1, ...lista2];
  }
}

String proximodalista(
  List<String> lista,
  String? questaoref,
) {
  // retorna proximo da lista após questaoref, se questaoref for o ultimo valor retorna o primeiro valor
  int index = lista.indexOf(questaoref ?? '');
  if (index == -1 || index == lista.length - 1) {
    return lista.first;
  } else {
    return lista[index + 1];
  }
}

String questaoanterior(
  List<String> lista,
  String questaoref,
) {
  // retorna valor anterior a questaoref, se questaoref for o primeiro retorna o ultimo valor
  int index = lista.indexOf(questaoref);
  if (index == 0) {
    return lista.last;
  } else {
    return lista[index - 1];
  }
}

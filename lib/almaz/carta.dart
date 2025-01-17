import 'dart:convert';

class Carta {
    String? object;
    String? id;
    String? oracleId;
    List<int>? multiverseIds;
    int? mtgoId;
    int? arenaId;
    int? tcgplayerId;
    int? cardmarketId;
    String? name;
    String? lang;
    DateTime? releasedAt;
    String? uri;
    String? scryfallUri;
    String? layout;
    bool? highresImage;
    String? imageStatus;
    ImageUris? imageUris;
    String? manaCost;
    int? cmc;
    String? typeLine;
    String? oracleText;
    String? power;
    String? toughness;
    List<String>? colors;
    List<String>? colorIdentity;
    List<dynamic>? keywords;
    Legalities? legalities;
    List<String>? games;
    bool? reserved;
    bool? foil;
    bool? nonfoil;
    List<String>? finishes;
    bool? oversized;
    bool? promo;
    bool? reprint;
    bool? variation;
    String? setId;
    String? cartaSet;
    String? setName;
    String? setType;
    String? setUri;
    String? setSearchUri;
    String? scryfallSetUri;
    String? rulingsUri;
    String? printsSearchUri;
    String? collectorNumber;
    bool? digital;
    String? rarity;
    String? flavorText;
    String? cardBackId;
    String? artist;
    List<String>? artistIds;
    String? illustrationId;
    String? borderColor;
    String? frame;
    List<String>? frameEffects;
    bool? fullArt;
    bool? textless;
    bool? booster;
    bool? storySpotlight;
    int? edhrecRank;
    int? pennyRank;
    Preview? preview;
    Prices? prices;
    RelatedUris? relatedUris;
    PurchaseUris? purchaseUris;

    Carta({
        this.object,
        this.id,
        this.oracleId,
        this.multiverseIds,
        this.mtgoId,
        this.arenaId,
        this.tcgplayerId,
        this.cardmarketId,
        this.name,
        this.lang,
        this.releasedAt,
        this.uri,
        this.scryfallUri,
        this.layout,
        this.highresImage,
        this.imageStatus,
        this.imageUris,
        this.manaCost,
        this.cmc,
        this.typeLine,
        this.oracleText,
        this.power,
        this.toughness,
        this.colors,
        this.colorIdentity,
        this.keywords,
        this.legalities,
        this.games,
        this.reserved,
        this.foil,
        this.nonfoil,
        this.finishes,
        this.oversized,
        this.promo,
        this.reprint,
        this.variation,
        this.setId,
        this.cartaSet,
        this.setName,
        this.setType,
        this.setUri,
        this.setSearchUri,
        this.scryfallSetUri,
        this.rulingsUri,
        this.printsSearchUri,
        this.collectorNumber,
        this.digital,
        this.rarity,
        this.flavorText,
        this.cardBackId,
        this.artist,
        this.artistIds,
        this.illustrationId,
        this.borderColor,
        this.frame,
        this.frameEffects,
        this.fullArt,
        this.textless,
        this.booster,
        this.storySpotlight,
        this.edhrecRank,
        this.pennyRank,
        this.preview,
        this.prices,
        this.relatedUris,
        this.purchaseUris,
    });

    factory Carta.fromRawJson(String str) => Carta.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Carta.fromJson(Map<String, dynamic> json) => Carta(
        object: json["object"],
        id: json["id"],
        oracleId: json["oracle_id"],
        multiverseIds: json["multiverse_ids"] == null ? [] : List<int>.from(json["multiverse_ids"]!.map((x) => x)),
        mtgoId: json["mtgo_id"],
        arenaId: json["arena_id"],
        tcgplayerId: json["tcgplayer_id"],
        cardmarketId: json["cardmarket_id"],
        name: json["name"],
        lang: json["lang"],
        releasedAt: json["released_at"] == null ? null : DateTime.parse(json["released_at"]),
        uri: json["uri"],
        scryfallUri: json["scryfall_uri"],
        layout: json["layout"],
        highresImage: json["highres_image"],
        imageStatus: json["image_status"],
        imageUris: json["image_uris"] == null ? null : ImageUris.fromJson(json["image_uris"]),
        manaCost: json["mana_cost"],
        cmc: json["cmc"],
        typeLine: json["type_line"],
        oracleText: json["oracle_text"],
        power: json["power"],
        toughness: json["toughness"],
        colors: json["colors"] == null ? [] : List<String>.from(json["colors"]!.map((x) => x)),
        colorIdentity: json["color_identity"] == null ? [] : List<String>.from(json["color_identity"]!.map((x) => x)),
        keywords: json["keywords"] == null ? [] : List<dynamic>.from(json["keywords"]!.map((x) => x)),
        legalities: json["legalities"] == null ? null : Legalities.fromJson(json["legalities"]),
        games: json["games"] == null ? [] : List<String>.from(json["games"]!.map((x) => x)),
        reserved: json["reserved"],
        foil: json["foil"],
        nonfoil: json["nonfoil"],
        finishes: json["finishes"] == null ? [] : List<String>.from(json["finishes"]!.map((x) => x)),
        oversized: json["oversized"],
        promo: json["promo"],
        reprint: json["reprint"],
        variation: json["variation"],
        setId: json["set_id"],
        cartaSet: json["set"],
        setName: json["set_name"],
        setType: json["set_type"],
        setUri: json["set_uri"],
        setSearchUri: json["set_search_uri"],
        scryfallSetUri: json["scryfall_set_uri"],
        rulingsUri: json["rulings_uri"],
        printsSearchUri: json["prints_search_uri"],
        collectorNumber: json["collector_number"],
        digital: json["digital"],
        rarity: json["rarity"],
        flavorText: json["flavor_text"],
        cardBackId: json["card_back_id"],
        artist: json["artist"],
        artistIds: json["artist_ids"] == null ? [] : List<String>.from(json["artist_ids"]!.map((x) => x)),
        illustrationId: json["illustration_id"],
        borderColor: json["border_color"],
        frame: json["frame"],
        frameEffects: json["frame_effects"] == null ? [] : List<String>.from(json["frame_effects"]!.map((x) => x)),
        fullArt: json["full_art"],
        textless: json["textless"],
        booster: json["booster"],
        storySpotlight: json["story_spotlight"],
        edhrecRank: json["edhrec_rank"],
        pennyRank: json["penny_rank"],
        preview: json["preview"] == null ? null : Preview.fromJson(json["preview"]),
        prices: json["prices"] == null ? null : Prices.fromJson(json["prices"]),
        relatedUris: json["related_uris"] == null ? null : RelatedUris.fromJson(json["related_uris"]),
        purchaseUris: json["purchase_uris"] == null ? null : PurchaseUris.fromJson(json["purchase_uris"]),
    );

    Map<String, dynamic> toJson() => {
        "object": object,
        "id": id,
        "oracle_id": oracleId,
        "multiverse_ids": multiverseIds == null ? [] : List<dynamic>.from(multiverseIds!.map((x) => x)),
        "mtgo_id": mtgoId,
        "arena_id": arenaId,
        "tcgplayer_id": tcgplayerId,
        "cardmarket_id": cardmarketId,
        "name": name,
        "lang": lang,
        "released_at": "${releasedAt!.year.toString().padLeft(4, '0')}-${releasedAt!.month.toString().padLeft(2, '0')}-${releasedAt!.day.toString().padLeft(2, '0')}",
        "uri": uri,
        "scryfall_uri": scryfallUri,
        "layout": layout,
        "highres_image": highresImage,
        "image_status": imageStatus,
        "image_uris": imageUris?.toJson(),
        "mana_cost": manaCost,
        "cmc": cmc,
        "type_line": typeLine,
        "oracle_text": oracleText,
        "power": power,
        "toughness": toughness,
        "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => x)),
        "color_identity": colorIdentity == null ? [] : List<dynamic>.from(colorIdentity!.map((x) => x)),
        "keywords": keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
        "legalities": legalities?.toJson(),
        "games": games == null ? [] : List<dynamic>.from(games!.map((x) => x)),
        "reserved": reserved,
        "foil": foil,
        "nonfoil": nonfoil,
        "finishes": finishes == null ? [] : List<dynamic>.from(finishes!.map((x) => x)),
        "oversized": oversized,
        "promo": promo,
        "reprint": reprint,
        "variation": variation,
        "set_id": setId,
        "set": cartaSet,
        "set_name": setName,
        "set_type": setType,
        "set_uri": setUri,
        "set_search_uri": setSearchUri,
        "scryfall_set_uri": scryfallSetUri,
        "rulings_uri": rulingsUri,
        "prints_search_uri": printsSearchUri,
        "collector_number": collectorNumber,
        "digital": digital,
        "rarity": rarity,
        "flavor_text": flavorText,
        "card_back_id": cardBackId,
        "artist": artist,
        "artist_ids": artistIds == null ? [] : List<dynamic>.from(artistIds!.map((x) => x)),
        "illustration_id": illustrationId,
        "border_color": borderColor,
        "frame": frame,
        "frame_effects": frameEffects == null ? [] : List<dynamic>.from(frameEffects!.map((x) => x)),
        "full_art": fullArt,
        "textless": textless,
        "booster": booster,
        "story_spotlight": storySpotlight,
        "edhrec_rank": edhrecRank,
        "penny_rank": pennyRank,
        "preview": preview?.toJson(),
        "prices": prices?.toJson(),
        "related_uris": relatedUris?.toJson(),
        "purchase_uris": purchaseUris?.toJson(),
    };
}

class ImageUris {
    String? small;
    String? normal;
    String? large;
    String? png;
    String? artCrop;
    String? borderCrop;

    ImageUris({
        this.small,
        this.normal,
        this.large,
        this.png,
        this.artCrop,
        this.borderCrop,
    });

    factory ImageUris.fromRawJson(String str) => ImageUris.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ImageUris.fromJson(Map<String, dynamic> json) => ImageUris(
        small: json["small"],
        normal: json["normal"],
        large: json["large"],
        png: json["png"],
        artCrop: json["art_crop"],
        borderCrop: json["border_crop"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "normal": normal,
        "large": large,
        "png": png,
        "art_crop": artCrop,
        "border_crop": borderCrop,
    };
}

class Legalities {
    String? standard;
    String? future;
    String? historic;
    String? timeless;
    String? gladiator;
    String? pioneer;
    String? explorer;
    String? modern;
    String? legacy;
    String? pauper;
    String? vintage;
    String? penny;
    String? commander;
    String? oathbreaker;
    String? standardbrawl;
    String? brawl;
    String? alchemy;
    String? paupercommander;
    String? duel;
    String? oldschool;
    String? premodern;
    String? predh;

    Legalities({
        this.standard,
        this.future,
        this.historic,
        this.timeless,
        this.gladiator,
        this.pioneer,
        this.explorer,
        this.modern,
        this.legacy,
        this.pauper,
        this.vintage,
        this.penny,
        this.commander,
        this.oathbreaker,
        this.standardbrawl,
        this.brawl,
        this.alchemy,
        this.paupercommander,
        this.duel,
        this.oldschool,
        this.premodern,
        this.predh,
    });

    factory Legalities.fromRawJson(String str) => Legalities.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Legalities.fromJson(Map<String, dynamic> json) => Legalities(
        standard: json["standard"],
        future: json["future"],
        historic: json["historic"],
        timeless: json["timeless"],
        gladiator: json["gladiator"],
        pioneer: json["pioneer"],
        explorer: json["explorer"],
        modern: json["modern"],
        legacy: json["legacy"],
        pauper: json["pauper"],
        vintage: json["vintage"],
        penny: json["penny"],
        commander: json["commander"],
        oathbreaker: json["oathbreaker"],
        standardbrawl: json["standardbrawl"],
        brawl: json["brawl"],
        alchemy: json["alchemy"],
        paupercommander: json["paupercommander"],
        duel: json["duel"],
        oldschool: json["oldschool"],
        premodern: json["premodern"],
        predh: json["predh"],
    );

    Map<String, dynamic> toJson() => {
        "standard": standard,
        "future": future,
        "historic": historic,
        "timeless": timeless,
        "gladiator": gladiator,
        "pioneer": pioneer,
        "explorer": explorer,
        "modern": modern,
        "legacy": legacy,
        "pauper": pauper,
        "vintage": vintage,
        "penny": penny,
        "commander": commander,
        "oathbreaker": oathbreaker,
        "standardbrawl": standardbrawl,
        "brawl": brawl,
        "alchemy": alchemy,
        "paupercommander": paupercommander,
        "duel": duel,
        "oldschool": oldschool,
        "premodern": premodern,
        "predh": predh,
    };
}

class Preview {
    String? source;
    String? sourceUri;
    DateTime? previewedAt;

    Preview({
        this.source,
        this.sourceUri,
        this.previewedAt,
    });

    factory Preview.fromRawJson(String str) => Preview.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Preview.fromJson(Map<String, dynamic> json) => Preview(
        source: json["source"],
        sourceUri: json["source_uri"],
        previewedAt: json["previewed_at"] == null ? null : DateTime.parse(json["previewed_at"]),
    );

    Map<String, dynamic> toJson() => {
        "source": source,
        "source_uri": sourceUri,
        "previewed_at": "${previewedAt!.year.toString().padLeft(4, '0')}-${previewedAt!.month.toString().padLeft(2, '0')}-${previewedAt!.day.toString().padLeft(2, '0')}",
    };
}

class Prices {
    String? usd;
    String? usdFoil;
    dynamic usdEtched;
    String? eur;
    String? eurFoil;
    String? tix;

    Prices({
        this.usd,
        this.usdFoil,
        this.usdEtched,
        this.eur,
        this.eurFoil,
        this.tix,
    });

    factory Prices.fromRawJson(String str) => Prices.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        usd: json["usd"],
        usdFoil: json["usd_foil"],
        usdEtched: json["usd_etched"],
        eur: json["eur"],
        eurFoil: json["eur_foil"],
        tix: json["tix"],
    );

    Map<String, dynamic> toJson() => {
        "usd": usd,
        "usd_foil": usdFoil,
        "usd_etched": usdEtched,
        "eur": eur,
        "eur_foil": eurFoil,
        "tix": tix,
    };
}

class PurchaseUris {
    String? tcgplayer;
    String? cardmarket;
    String? cardhoarder;

    PurchaseUris({
        this.tcgplayer,
        this.cardmarket,
        this.cardhoarder,
    });

    factory PurchaseUris.fromRawJson(String str) => PurchaseUris.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PurchaseUris.fromJson(Map<String, dynamic> json) => PurchaseUris(
        tcgplayer: json["tcgplayer"],
        cardmarket: json["cardmarket"],
        cardhoarder: json["cardhoarder"],
    );

    Map<String, dynamic> toJson() => {
        "tcgplayer": tcgplayer,
        "cardmarket": cardmarket,
        "cardhoarder": cardhoarder,
    };
}

class RelatedUris {
    String? gatherer;
    String? tcgplayerInfiniteArticles;
    String? tcgplayerInfiniteDecks;
    String? edhrec;

    RelatedUris({
        this.gatherer,
        this.tcgplayerInfiniteArticles,
        this.tcgplayerInfiniteDecks,
        this.edhrec,
    });

    factory RelatedUris.fromRawJson(String str) => RelatedUris.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RelatedUris.fromJson(Map<String, dynamic> json) => RelatedUris(
        gatherer: json["gatherer"],
        tcgplayerInfiniteArticles: json["tcgplayer_infinite_articles"],
        tcgplayerInfiniteDecks: json["tcgplayer_infinite_decks"],
        edhrec: json["edhrec"],
    );

    Map<String, dynamic> toJson() => {
        "gatherer": gatherer,
        "tcgplayer_infinite_articles": tcgplayerInfiniteArticles,
        "tcgplayer_infinite_decks": tcgplayerInfiniteDecks,
        "edhrec": edhrec,
    };
}
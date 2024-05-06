package vn.tayjava.util;

public interface AppConst {


    String SEARCH_OPERATOR = "(\\w+?)(:|<|>)(.*)";
    String SEARCH_SPEC_OPERATOR = "(\\w+?)([<:>~!])(\\p{Punct}?)(.*)(\\p{Punct}?)";
    String SORT_BY = "(\\w+?)(:)(.*)";
    String ADDRESS_REGEX = "address_";

}

import React from "react";

// import styles from "./index.scss";
import "./index2.css";


interface Props {
    illustration: string;
    title: string;
    subtitle: string;
    image?: string;
    bgColor?: string;
    textColor?: string;
}



const ComingSoon: React.FC<Props> = (props: Props) => {

    const {
        image,
        bgColor,
        textColor,
        illustration,
        title,
        subtitle
    } = props;

    return (
        <section
            className={'soon-fullpage'}
            style={{
                backgroundImage: image ? `url(${image})` : "",
                backgroundColor: bgColor ? bgColor : "#000000",
                color: textColor ? textColor : "#000"
            }}
        >
            <div className={'soon-content'}>
                <div>
                    <h1 className={'soon-h1'}>{title}</h1>
                    <h3 className={'soon-h3'}>{subtitle}</h3>
                </div>
            </div>
        </section>
    );
};

export default ComingSoon;
